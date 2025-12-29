<template>
    <VerifyRegistrationOtp />
</template>

<script setup>
import { useHead } from '@vueuse/head';
import VerifyRegistrationOtp from '../../components/auth/VerifyRegistrationOtp.vue';
useHead({
    title: "Xác thực tài khoản | DEVGANG",
    meta: [
        {
            name: "description",
            content: "Xác thực tài khoản"
        }
    ]
})
</script>

