<template>
    <!-- <div class="form-container mx-auto mt-[100px] bg-white mb-10 border border-gray-200"> -->
    <div class="register-form-container mx-auto mt-[100px] bg-white mb-10 border border-gray-200 
            rounded-lg
            w-[90%] sm:w-[400px] md:w-[500px] max-w-[500px]
            px-4 sm:px-6 py-6">
        <h2 class="text-center mb-4 font-semibold text-2xl">Đăng Ký</h2>
        <form @submit.prevent="handleRegister">
            <div class="mb-3">
                <label for="registerUsername" class="block mb-1 font-medium">Tên người dùng <span
                        class="text-red-500">*</span></label>
                <input v-model="form.username" id="registerUsername" type="text" placeholder="Nhập tên người dùng"
                    class="w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-[#81aacc] focus:ring-1 focus:ring-[#81aacc]" />
                <p v-if="error.username" class="text-red-500 text-sm mt-1">{{ error.username }}</p>
            </div>

            <div class="mb-3">
                <label for="registerEmail" class="block mb-1 font-medium">Email <span
                        class="text-red-500">*</span></label>
                <input v-model="form.email" id="registerEmail" type="email" placeholder="Nhập email"
                    class="w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:border-[#81aacc] focus:ring-1 focus:ring-[#81aacc]" />
                <p v-if="error.email" class="text-red-500 text-sm mt-1">{{ error.email }}</p>
            </div>

            <div class="mb-3">
                <label for="registerPassword" class="block mb-1 font-medium">Mật khẩu <span
                        class="text-red-500">*</span></label>
                <div class="relative">
                    <input v-model="form.password" :type="showPassword ? 'text' : 'password'" id="registerPassword"
                        placeholder="Nhập mật khẩu"
                        class="w-full px-3 py-2 pr-10 border border-gray-300 rounded focus:outline-none focus:border-[#81aacc] focus:ring-1 focus:ring-[#81aacc]" />
                    <button type="button" @click="showPassword = !showPassword"
                        class="absolute top-1/2 right-3 -translate-y-1/2 text-[#81aacc]" tabindex="-1">
                        <i :class="showPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye'"></i>
                    </button>
                </div>
                <p v-if="error.password" class="text-red-500 text-sm mt-1">{{ error.password }}</p>
            </div>

            <div class="mb-3">
                <label for="confirmPassword" class="block mb-1 font-medium">Xác nhận mật khẩu <span
                        class="text-red-500">*</span></label>
                <div class="relative">
                    <input v-model="form.confirm_password" :type="showConfirmPassword ? 'text' : 'password'"
                        id="confirmPassword" placeholder="Xác nhận mật khẩu"
                        class="w-full px-3 py-2 pr-10 border border-gray-300 rounded focus:outline-none focus:border-[#81aacc] focus:ring-1 focus:ring-[#81aacc]" />
                    <button type="button" @click="showConfirmPassword = !showConfirmPassword"
                        class="absolute top-1/2 right-3 -translate-y-1/2 text-[#81aacc]" tabindex="-1">
                        <i :class="showConfirmPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye'"></i>
                    </button>
                </div>
                <p v-if="error.confirm_password" class="text-red-500 text-sm mt-1">{{ error.confirm_password }}</p>
                <p v-if="error.register" class="text-red-500 text-sm mt-1">{{ error.register }}</p>
            </div>

            <button type="submit" class="py-2 rounded-lg bg-[#81AACC] text-white hover:bg-[#66a2d3] w-full relative"
                :disabled="isLoading">
                <span :class="{ 'opacity-0': isLoading }">Đăng Ký</span>
                <div v-if="isLoading" class="absolute inset-0 flex items-center justify-center">
                    <div class="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                </div>
            </button>

            <div class="text-center mt-3">
                <router-link to="/login" class="text-md text-gray-500">
                    Đã có tài khoản? <span class="text-[#81aacc] hover:underline">Đăng nhập ngay</span>
                </router-link>
            </div>
        </form>
    </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useAuth } from '../../composable/useAuth'
import { useAuthStore } from '../../stores/auth'
import Cookies from 'js-cookie'
import { push } from 'notivue'

const { register } = useAuth()
const authStore = useAuthStore()

const form = reactive({
    username: '',
    email: '',
    password: '',
    confirm_password: ''
})

const error = reactive({
    username: '',
    email: '',
    password: '',
    confirm_password: '',
    register: ''
})

const isLoading = ref(false)
const showPassword = ref(false)
const showConfirmPassword = ref(false)

const isEmailValid = (email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)

const resetErrors = () => {
    error.username = ''
    error.email = ''
    error.password = ''
    error.confirm_password = ''
    error.register = ''
}

const handleRegister = async () => {
    resetErrors()
    isLoading.value = true

    let hasError = false

    if (!form.username) {
        error.username = 'Vui lòng nhập tên người dùng'
        hasError = true
    }
    if (!form.email) {
        error.email = 'Vui lòng nhập email'
        hasError = true
    } else if (!isEmailValid(form.email)) {
        error.email = 'Email không hợp lệ'
        hasError = true
    }
    if (!form.password) {
        error.password = 'Vui lòng nhập mật khẩu'
        hasError = true
    } else if (form.password.length < 6) {
        error.password = 'Mật khẩu phải có ít nhất 6 ký tự'
        hasError = true
    }
    if (!form.confirm_password) {
        error.confirm_password = 'Vui lòng xác nhận mật khẩu'
        hasError = true
    } else if (form.password !== form.confirm_password) {
        error.confirm_password = 'Mật khẩu xác nhận không khớp'
        hasError = true
    }

    if (hasError) {
        isLoading.value = false
        return
    }

    try {
        const res = await register({
            username: form.username,
            email: form.email,
            password: form.password,
            role: 'user'
        });
        if (res) {
            isLoading.value = false
            push.success('Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.')
            // Chuyển hướng đến trang xác thực OTP
            setTimeout(() => {
                window.location.href = `/verify-registration?email=${encodeURIComponent(form.email)}`
            }, 2000)
        }
    } catch (err) {
        isLoading.value = false
        if (err.response && err.response.data) {
            const errorMessage = err.response.data.error || err.response.data.message || 'Đăng ký thất bại!'
            error.register = errorMessage
            push.error(errorMessage)
        } else {
            error.register = 'Đăng ký thất bại! Vui lòng thử lại sau.'
            push.error('Đăng ký thất bại! Vui lòng thử lại sau.')
        }
    }
}
</script>

<style scoped>
/* Đảm bảo container form không chặn tương tác */
.register-form-container {
    position: relative;
    z-index: 1;
    pointer-events: auto;
}

/* Đảm bảo các phần tử khác vẫn có thể tương tác */
form {
    position: relative;
    z-index: 1;
}

/* Đảm bảo router-link vẫn hoạt động */
a {
    position: relative;
    z-index: 100 !important;
    pointer-events: auto !important;
    cursor: pointer !important;
}
</style>

<style>
/* Global style để đảm bảo navigation không bị chặn trên trang đăng ký */
body {
    overflow-x: hidden;
}

/* Đảm bảo router-link hoạt động trên toàn bộ trang */
a[href],
router-link,
a.router-link-active,
a.router-link-exact-active {
    pointer-events: auto !important;
    z-index: 1000 !important;
    position: relative;
    cursor: pointer !important;
}

/* Đảm bảo header và footer không bị chặn */
header,
footer,
nav {
    position: relative;
    z-index: 100 !important;
    pointer-events: auto !important;
}

/* Đảm bảo không có overlay nào chặn trên trang đăng ký */
body:has(.register-form-container) {
    overflow: visible !important;
}

body:has(.register-form-container) * {
    pointer-events: auto !important;
}
</style>