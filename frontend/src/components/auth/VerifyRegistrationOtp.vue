<template>
    <div class="flex items-center justify-center p-4 mt-5">
        <main class="bg-white rounded-xl max-w-md w-full p-[30px] text-center border border-gray-200">
            <h1 class="font-extrabold text-xl leading-tight mb-3">Xác thực tài khoản</h1>
            <p class="text-[#4A5568] mb-8 text-base leading-relaxed">
                Nhập 6 số từ email của bạn để xác thực tài khoản
            </p>

            <form @submit.prevent="handleVerifyOtp" class="mb-6">
                <!-- OTP Inputs -->
                <div class="flex justify-center gap-4 mb-5">
                    <input v-for="(digit, index) in 6" :key="index" v-model="otpInputs[index]" type="text" maxlength="1"
                        :id="`otp-${index}`"
                        class="w-14 h-14 rounded-md bg-[#F1F5F9] text-center text-xl font-semibold text-black focus:outline-none focus:ring-2"
                        :class="otpError ? 'ring-red-400 border border-red-400' : 'focus:ring-[#81AACC]'"
                        inputmode="numeric" pattern="[0-9]*" :aria-label="`Digit ${index + 1}`"
                        @input="(e) => onDigitInput(e, index)" />
                </div>
                <p v-if="otpError" class="text-red-500 text-sm mb-4">{{ otpError }}</p>

                <!-- Email (hidden) -->
                <input v-model="emailInput" type="hidden" />

                <!-- Submit -->
                <button type="submit" :disabled="isSubmitting"
                    class="bg-[#81AACC] text-white hover:bg-[#66a2d3] w-full py-2 rounded-lg relative flex justify-center items-center cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed">
                    <span v-if="!isSubmitting">Xác thực tài khoản</span>
                    <span v-else>
                        <i class="fas fa-spinner animate-spin mr-2"></i> Đang xử lý...
                    </span>
                </button>
            </form>

            <p class="mt-5 text-[#4A5568] text-sm">
                Bạn không nhận được mã?
                <button @click="resendOtp" :disabled="isResending" class="text-[#81AACC] font-semibold cursor-pointer hover:underline disabled:opacity-50">
                    <span v-if="!isResending">Gửi lại</span>
                    <span v-else>Đang gửi...</span>
                </button>
            </p>
        </main>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useAuth } from '../../composable/useAuth'
import { push } from 'notivue'
import api from '../../utils/api'

const router = useRouter()
const route = useRoute()
const { verifyRegistrationOtp } = useAuth()

const emailInput = ref(route.query.email || '')
const otpInputs = ref(Array(6).fill(''))
const isSubmitting = ref(false)
const isResending = ref(false)

// Error states
const otpError = ref('')

const onDigitInput = (event, index) => {
    const value = event.target.value

    // Nếu paste 6 số cùng lúc
    if (value.length === 6 && /^\d{6}$/.test(value)) {
        for (let i = 0; i < 6; i++) {
            otpInputs.value[i] = value[i]
        }
        setTimeout(() => {
            document.getElementById('otp-5')?.focus()
        }, 10)
        return
    }

    // Chỉ cho phép số
    if (!/^\d*$/.test(value)) {
        event.target.value = ''
        otpInputs.value[index] = ''
        return
    }

    // Tự động chuyển sang ô tiếp theo
    if (value.length === 1 && index < otpInputs.value.length - 1) {
        const nextInput = document.getElementById(`otp-${index + 1}`)
        nextInput?.focus()
    }
}

const handleVerifyOtp = async () => {
    // Reset error messages
    otpError.value = ''

    const otpRaw = otpInputs.value.join('')
    if (!/^\d{6}$/.test(otpRaw)) {
        otpError.value = 'Vui lòng nhập đầy đủ 6 chữ số OTP.'
        return
    }

    if (!emailInput.value) {
        otpError.value = 'Email không hợp lệ.'
        return
    }

    try {
        isSubmitting.value = true
        const otp = otpRaw.split('').map(Number)
        const result = await verifyRegistrationOtp(emailInput.value, otp)
        
        if (result) {
            push.success('Xác thực thành công! Đang chuyển hướng...')
            setTimeout(() => {
                router.push('/')
            }, 2000)
        }
    } catch (error) {
        console.error(error)
        if (error.response && error.response.data && error.response.data.error) {
            otpError.value = error.response.data.error
        } else {
            otpError.value = 'Xác thực thất bại. Vui lòng thử lại.'
        }
        push.error('Xác thực thất bại')
    } finally {
        isSubmitting.value = false
    }
}

const resendOtp = async () => {
    if (!emailInput.value) {
        push.error('Email không hợp lệ')
        return
    }

    try {
        isResending.value = true
        // Gọi API để gửi lại OTP (có thể tạo endpoint riêng hoặc dùng lại register)
        await api.post('/api/resend-registration-otp', { email: emailInput.value })
        push.success('Mã OTP đã được gửi lại đến email của bạn')
    } catch (error) {
        console.error(error)
        push.error('Không thể gửi lại mã OTP. Vui lòng thử lại.')
    } finally {
        isResending.value = false
    }
}

onMounted(() => {
    if (!emailInput.value) {
        push.error('Email không hợp lệ')
        router.push('/register')
    }
})
</script>

