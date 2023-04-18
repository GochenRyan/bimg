target("libBImg")
    set_kind("static")

    local BX_DIR = "$(projectdir)/Vendor/bx/"
    local BIMG_DIR = "$(projectdir)/Vendor/bimg/"

    add_includedirs(BIMG_DIR .. "include")
    add_includedirs(BIMG_DIR .. "3rdparty/astc-encoder/include")
    add_includedirs(BX_DIR .. "include")
    
    if is_plat("windows") then 

        add_defines("__STDC_LIMIT_MACROS"
                , "__STDC_FORMAT_MACROS"
                , "__STDC_CONSTANT_MACROS"
                , "NDEBUG"
                , "WIN32"
                , "_WIN32"
                , "_HAS_EXCEPTIONS=0"
                , "_HAS_ITERATOR_DEBUGGING=0"
                , "_ITERATOR_DEBUG_LEVEL=0"
                , "_SCL_SECURE=0"
                , "_SECURE_SCL=0"
                , "_SCL_SECURE_NO_WARNINGS"
                , "_CRT_SECURE_NO_WARNINGS"
                , "_CRT_SECURE_NO_DEPRECATE"
                , "BX_CONFIG_DEBUG")

        add_includedirs(BX_DIR .. "include/compat/msvc")

    elseif  is_plat("macosx") then 
        add_includedirs(BX_DIR .. "include/compat/osx")        
    end
    
    add_files(BIMG_DIR .. "src/image.cpp")
    add_files(BIMG_DIR .. "src/image_gnf.cpp")
