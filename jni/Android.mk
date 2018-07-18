BUILD_DIRECTORY := $(call my-dir)


CONFIGURE_CMD-x86 := configure.py --os=android --prefix="android" --cpu=x86_32 --cc=clang  --cc-abi-flags="-arch x86_32" --minimized-build --enable-modules=aead,aes,camellia,cbc,cbc_mac,cfb,chacha,chacha20poly1305,chacha_rng,chacha_sse2,checksum,clmul,clmul_ssse3,cmac,crc24,crc32,ctr,curve25519,gcm,gmac,hash,hash_id,hex,hkdf,hmac,hmac_drbg,locking_allocator,mac,mdx_hash,rng,salsa20,sha1,sha1_sse2,sha1_x86,sha2_32,sha2_32_bmi2,sha2_32_x86,sha2_64,sha3,stream,system_rng --amalgamation
CONFIGURE_CMD-armeabi-v7a := configure.py --os=android --prefix="android" --cpu=armv7-a --cc=clang  --cc-abi-flags="-arch armv7-a" --minimized-build --enable-modules=aead,aes,camellia,cbc,cbc_mac,cfb,chacha,chacha20poly1305,chacha_rng,chacha_sse2,checksum,clmul,clmul_ssse3,cmac,crc24,crc32,ctr,curve25519,gcm,gmac,hash,hash_id,hex,hkdf,hmac,hmac_drbg,locking_allocator,mac,mdx_hash,rng,salsa20,sha1,sha1_sse2,sha1_x86,sha2_32,sha2_32_bmi2,sha2_32_x86,sha2_64,sha3,stream,system_rng --amalgamation --without-os-feature=getauxval
CONFIGURE_CMD := $(CONFIGURE_CMD-$(TARGET_ARCH_ABI))
TARGET_DIR_NAME := src-$(TARGET_ARCH_ABI)
CONFIGURE_RESULT := $(shell ($(BUILD_DIRECTORY)/../$(CONFIGURE_CMD)))

#$(shell ($(BUILD_DIRECTORY)/../$(CONFIGURE_CMD)))
$(shell mkdir -p $(TARGET_DIR_NAME) >/dev/null 2>&1 || true)
$(shell mv *.cpp $(TARGET_DIR_NAME))
$(shell mv *.h $(TARGET_DIR_NAME))



LOCAL_PATH := $(BUILD_DIRECTORY)
include $(CLEAR_VARS)
LOCAL_MODULE := botan
LOCAL_CFLAGS := -D_REENTRANT -fPIC 
LOCAL_C_INCLUDES +=  $(LOCAL_PATH)/../build/include/
LOCAL_C_INCLUDES +=  $(LOCAL_PATH)/../build/include/external/
LOCAL_SRC_FILES :=
LOCAL_SRC_FILES += ../$(TARGET_DIR_NAME)/botan_all.cpp
ifeq ("$(TARGET_ARCH_ABI)", "x86")
LOCAL_SRC_FILES += ../$(TARGET_DIR_NAME)/botan_all_aesni.cpp
LOCAL_SRC_FILES += ../$(TARGET_DIR_NAME)/botan_all_bmi2.cpp
LOCAL_SRC_FILES += ../$(TARGET_DIR_NAME)/botan_all_sha_sse41_ssse3.cpp
LOCAL_SRC_FILES += ../$(TARGET_DIR_NAME)/botan_all_ssse3.cpp
LOCAL_SRC_FILES += ../$(TARGET_DIR_NAME)/botan_all_sse2.cpp
endif

include $(BUILD_SHARED_LIBRARY) 
