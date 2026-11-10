section .text

global gfx_init
global gfx_exit
global gfx_fill

; ================
; gfx_init_palette
; Set up 16 standard VGA colors
; ================
gfx_init_palette:
    pusha

    ; Start at palette index 0
    mov dx, 0x3C8
    xor al, al
    out dx, al

    ; Data port
    mov dx, 0x3C9

    ; Color 0: Black (0,0,0)
    xor al, al
    out dx, al
    out dx, al
    out dx, al

    ; Color 1: Blue (0,0,42)
    xor al, al
    out dx, al
    xor al, al
    out dx, al
    mov al, 42
    out dx, al

    ; Color 2: Green (0,42,0)
    xor al, al
    out dx, al
    mov al, 42
    out dx, al
    xor al, al
    out dx, al

    ; Color 3: Cyan (0,42,42)
    xor al, al
    out dx, al
    mov al, 42
    out dx, al
    mov al, 42
    out dx, al

    ; Color 4: Red (42,0,0)
    mov al, 42
    out dx, al
    xor al, al
    out dx, al
    xor al, al
    out dx, al

    ; Color 5: Magenta (42,0,42)
    mov al, 42
    out dx, al
    xor al, al
    out dx, al
    mov al, 42
    out dx, al

    ; Color 6: Brown (42,21,0)
    mov al, 42
    out dx, al
    mov al, 21
    out dx, al
    xor al, al
    out dx, al

    ; Color 7: Light Gray (42,42,42)
    mov al, 42
    out dx, al
    mov al, 42
    out dx, al
    mov al, 42
    out dx, al

    ; Color 8: Dark Gray (21,21,21)
    mov al, 21
    out dx, al
    mov al, 21
    out dx, al
    mov al, 21
    out dx, al

    ; Color 9: Light Blue (21,21,63)
    mov al, 21
    out dx, al
    mov al, 21
    out dx, al
    mov al, 63
    out dx, al

    ; Color 10: Light Green (21,63,21)
    mov al, 21
    out dx, al
    mov al, 63
    out dx, al
    mov al, 21
    out dx, al

    ; Color 11: Light Cyan (21,63,63)
    mov al, 21
    out dx, al
    mov al, 63
    out dx, al
    mov al, 63
    out dx, al

    ; Color 12: Light Red (63,21,21)
    mov al, 63
    out dx, al
    mov al, 21
    out dx, al
    mov al, 21
    out dx, al

    ; Color 13: Light Magenta (63,21,63)
    mov al, 63
    out dx, al
    mov al, 21
    out dx, al
    mov al, 63
    out dx, al

    ; Color 14: Yellow (63,63,21)
    mov al, 63
    out dx, al
    mov al, 63
    out dx, al
    mov al, 21
    out dx, al

    ; Color 15: White (63,63,63)
    mov al, 63
    out dx, al
    out dx, al
    out dx, al

    popa
    ret

; ================
; gfx_init
; Set VGA Mode 13h (320x200x256)
; ================
gfx_init:
    pusha

    ; --- Misc Output Register ---
    mov dx, 0x3C2
    mov al, 0x63
    out dx, al

    ; --- Sequencer ---
    mov dx, 0x3C4
    mov al, 0x00
    out dx, al
    inc dx
    mov al, 0x03
    out dx, al

    dec dx
    mov al, 0x01
    out dx, al
    inc dx
    mov al, 0x01
    out dx, al

    dec dx
    mov al, 0x02
    out dx, al
    inc dx
    mov al, 0x0F
    out dx, al

    dec dx
    mov al, 0x03
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x04
    out dx, al
    inc dx
    mov al, 0x0E
    out dx, al

    ; --- CRTC ---
    ; Unlock
    mov dx, 0x3D4
    mov al, 0x11
    out dx, al
    inc dx
    mov al, 0x0C
    out dx, al

    ; Standard Mode 13h values
    mov dx, 0x3D4
    mov al, 0x00
    out dx, al
    inc dx
    mov al, 0x5F
    out dx, al

    dec dx
    mov al, 0x01
    out dx, al
    inc dx
    mov al, 0x4F
    out dx, al

    dec dx
    mov al, 0x02
    out dx, al
    inc dx
    mov al, 0x50
    out dx, al

    dec dx
    mov al, 0x03
    out dx, al
    inc dx
    mov al, 0x82
    out dx, al

    dec dx
    mov al, 0x04
    out dx, al
    inc dx
    mov al, 0x54
    out dx, al

    dec dx
    mov al, 0x05
    out dx, al
    inc dx
    mov al, 0x80
    out dx, al

    dec dx
    mov al, 0x06
    out dx, al
    inc dx
    mov al, 0xBF
    out dx, al

    dec dx
    mov al, 0x07
    out dx, al
    inc dx
    mov al, 0x1F
    out dx, al

    dec dx
    mov al, 0x08
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x09
    out dx, al
    inc dx
    mov al, 0x41
    out dx, al

    dec dx
    mov al, 0x0A
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x0B
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x0C
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x0D
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x0E
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x0F
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x10
    out dx, al
    inc dx
    mov al, 0x9C
    out dx, al

    dec dx
    mov al, 0x11
    out dx, al
    inc dx
    mov al, 0x8E
    out dx, al

    dec dx
    mov al, 0x12
    out dx, al
    inc dx
    mov al, 0x8F
    out dx, al

    dec dx
    mov al, 0x13
    out dx, al
    inc dx
    mov al, 0x28
    out dx, al

    dec dx
    mov al, 0x14
    out dx, al
    inc dx
    mov al, 0x40
    out dx, al

    dec dx
    mov al, 0x15
    out dx, al
    inc dx
    mov al, 0x96
    out dx, al

    dec dx
    mov al, 0x16
    out dx, al
    inc dx
    mov al, 0xB9
    out dx, al

    dec dx
    mov al, 0x17
    out dx, al
    inc dx
    mov al, 0xA3
    out dx, al

    dec dx
    mov al, 0x18
    out dx, al
    inc dx
    mov al, 0xFF
    out dx, al

    ; --- Graphics Controller ---
    mov dx, 0x3CE
    xor al, al
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x01
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x02
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x03
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x04
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x05
    out dx, al
    inc dx
    mov al, 0x40
    out dx, al

    dec dx
    mov al, 0x06
    out dx, al
    inc dx
    mov al, 0x05
    out dx, al

    dec dx
    mov al, 0x07
    out dx, al
    inc dx
    mov al, 0x0F
    out dx, al

    dec dx
    mov al, 0x08
    out dx, al
    inc dx
    mov al, 0xFF
    out dx, al

    ; --- Attribute Controller ---
    ; Reset flip-flop
    mov dx, 0x3DA
    in al, dx

    ; Mode control
    mov dx, 0x3C0
    mov al, 0x10
    out dx, al
    mov al, 0x41
    out dx, al

    ; Overscan
    mov al, 0x11
    out dx, al
    xor al, al
    out dx, al

    ; Color plane enable
    mov al, 0x12
    out dx, al
    mov al, 0x0F
    out dx, al

    ; Horizontal panning
    mov al, 0x13
    out dx, al
    xor al, al
    out dx, al

    ; Color select
    mov al, 0x14
    out dx, al
    xor al, al
    out dx, al

   call gfx_init_palette

    popa
    ret

; ================
; gfx_exit
; Return to VGA text mode (Mode 3h)
; ================
gfx_exit:
    pusha

    ; --- Misc ---
    mov dx, 0x3C2
    mov al, 0x67
    out dx, al

    ; --- Sequencer ---
    mov dx, 0x3C4
    mov al, 0x00
    out dx, al
    inc dx
    mov al, 0x03
    out dx, al

    dec dx
    mov al, 0x01
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x02
    out dx, al
    inc dx
    mov al, 0x03
    out dx, al

    dec dx
    mov al, 0x03
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x04
    out dx, al
    inc dx
    mov al, 0x02
    out dx, al

    ; --- CRTC ---
    mov dx, 0x3D4
    mov al, 0x11
    out dx, al
    inc dx
    mov al, 0x0C
    out dx, al

    ; Standard Mode 3h
    mov dx, 0x3D4
    mov al, 0x00
    out dx, al
    inc dx
    mov al, 0x5F
    out dx, al

    dec dx
    mov al, 0x01
    out dx, al
    inc dx
    mov al, 0x4F
    out dx, al

    dec dx
    mov al, 0x02
    out dx, al
    inc dx
    mov al, 0x50
    out dx, al

    dec dx
    mov al, 0x03
    out dx, al
    inc dx
    mov al, 0x82
    out dx, al

    dec dx
    mov al, 0x04
    out dx, al
    inc dx
    mov al, 0x55
    out dx, al

    dec dx
    mov al, 0x05
    out dx, al
    inc dx
    mov al, 0x81
    out dx, al

    dec dx
    mov al, 0x06
    out dx, al
    inc dx
    mov al, 0xBF
    out dx, al

    dec dx
    mov al, 0x07
    out dx, al
    inc dx
    mov al, 0x1F
    out dx, al

    dec dx
    mov al, 0x08
    out dx, al
    inc dx
    mov al, 0x00
    out dx, al

    dec dx
    mov al, 0x09
    out dx, al
    inc dx
    mov al, 0x4F
    out dx, al

    dec dx
    mov al, 0x0A
    out dx, al
    inc dx
    mov al, 0x0D
    out dx, al

    dec dx
    mov al, 0x0B
    out dx, al
    inc dx
    mov al, 0x0E
    out dx, al

    dec dx
    mov al, 0x0C
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x0D
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x0E
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x0F
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x10
    out dx, al
    inc dx
    mov al, 0x9C
    out dx, al

    dec dx
    mov al, 0x11
    out dx, al
    inc dx
    mov al, 0x8E
    out dx, al

    dec dx
    mov al, 0x12
    out dx, al
    inc dx
    mov al, 0x8F
    out dx, al

    dec dx
    mov al, 0x13
    out dx, al
    inc dx
    mov al, 0x28
    out dx, al

    dec dx
    mov al, 0x14
    out dx, al
    inc dx
    mov al, 0x1F
    out dx, al

    dec dx
    mov al, 0x15
    out dx, al
    inc dx
    mov al, 0x96
    out dx, al

    dec dx
    mov al, 0x16
    out dx, al
    inc dx
    mov al, 0xB9
    out dx, al

    dec dx
    mov al, 0x17
    out dx, al
    inc dx
    mov al, 0xA3
    out dx, al

    dec dx
    mov al, 0x18
    out dx, al
    inc dx
    mov al, 0xFF
    out dx, al

    ; --- Graphics Controller ---
    mov dx, 0x3CE
    xor al, al
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x01
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x02
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x03
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x04
    out dx, al
    inc dx
    xor al, al
    out dx, al

    dec dx
    mov al, 0x05
    out dx, al
    inc dx
    mov al, 0x10
    out dx, al

    dec dx
    mov al, 0x06
    out dx, al
    inc dx
    mov al, 0x0E
    out dx, al

    dec dx
    mov al, 0x07
    out dx, al
    inc dx
    mov al, 0x0F
    out dx, al

    dec dx
    mov al, 0x08
    out dx, al
    inc dx
    mov al, 0xFF
    out dx, al

    ; --- Attribute Controller ---
    mov dx, 0x3DA
    in al, dx

    mov dx, 0x3C0
    mov al, 0x10
    out dx, al
    mov al, 0x0C
    out dx, al

    mov al, 0x11
    out dx, al
    xor al, al
    out dx, al

    mov al, 0x12
    out dx, al
    mov al, 0x0F
    out dx, al

    mov al, 0x13
    out dx, al
    mov al, 0x08
    out dx, al

    mov al, 0x14
    out dx, al
    xor al, al
    out dx, al

    popa
    ret

; ================
; gfx_fill
; al = color (0-255)
; Fill entire screen with color
; ================
gfx_fill:
    pusha
    mov bl, al
    mov edi, 0xA0000
    mov ecx, 64000
.loop:
    mov [edi], bl
    inc edi
    dec ecx
    jnz .loop
    popa
    ret
