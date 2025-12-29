import { ref, onBeforeUnmount } from 'vue';

export const useCaptcha = () => {
    const captchaToken = ref(null)
    const widgetId = ref(null)

    const renderCaptcha = () => {
        if (typeof window !== 'undefined' && window.turnstile) {
            try {
                // Kiểm tra xem element có tồn tại không
                const element = document.getElementById('cf-turnstile')
                if (!element) {
                    console.warn('Captcha container not found')
                    return
                }

                // Xóa widget cũ nếu có
                if (widgetId.value) {
                    try {
                        window.turnstile.remove(widgetId.value)
                    } catch (e) {
                        console.warn('Error removing old captcha widget:', e)
                    }
                }

                widgetId.value = window.turnstile.render('#cf-turnstile', {
                    sitekey: import.meta.env.VITE_TURNSTILE_SITE_KEY,
                    callback: (t) => {
                        captchaToken.value = t
                        console.log('Captcha verified')
                    },
                    'error-callback': () => {
                        captchaToken.value = null
                        console.error('Captcha error')
                    },
                    'expired-callback': () => {
                        captchaToken.value = null
                        console.log('Captcha expired')
                    },
                })
            } catch (error) {
                console.error('Error rendering captcha:', error)
            }
        } else {
            // Đợi script load xong
            const checkTurnstile = setInterval(() => {
                if (typeof window !== 'undefined' && window.turnstile) {
                    clearInterval(checkTurnstile)
                    renderCaptcha()
                }
            }, 100)

            // Timeout sau 5 giây
            setTimeout(() => {
                clearInterval(checkTurnstile)
                if (!widgetId.value) {
                    console.warn('Turnstile script not loaded after 5 seconds')
                }
            }, 5000)
        }
    }

    const cleanup = () => {
        // Xóa widget khi component unmount
        if (widgetId.value && typeof window !== 'undefined' && window.turnstile) {
            try {
                window.turnstile.remove(widgetId.value)
            } catch (e) {
                console.warn('Error removing captcha on unmount:', e)
            }
        }
    }

    onBeforeUnmount(() => {
        cleanup()
    })

    return {
        captchaToken,
        renderCaptcha,
        cleanup
    }
}