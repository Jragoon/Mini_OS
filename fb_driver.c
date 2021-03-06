#define FB_WHITE 15
#define FB_BLACK 0

char *fb = (char *) 0x000B8000;
/** fb_write_cell
 * Writes a character with foreground and background to position i in the framebuffer.
 * 
 * @param i  The location in framebuffer
 * @param c  The character
 * @param fg The foreground color
 * @param bg The background color
 */
void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg) {
    fb[i] = c;
    fb[i+1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
}

