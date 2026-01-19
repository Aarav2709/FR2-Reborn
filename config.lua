application = {
    content = {
        width = 480,
        height = 320,
        scale = "adaptive", -- "letterbox" yerine "adaptive" kullanarak boşlukları doldurur
        xAlign = "center",
        yAlign = "center",
        fps = 60,
        imageSuffix = {
            ["@2x"] = 1.5,
            ["@3x"] = 2.5
        }
    }
}