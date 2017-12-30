#ifndef _HYDRV_OLED_H_
#define _HYDRV_OLED_H_

#include "image.h"
#include "common.h"
#include "lpld_wrapper.h"

#define OLED_COL (128)
#define OLED_PAGE (8)
#define OLED_ROW (64)

typedef struct {
    gpio_cfg_t scl;
	gpio_cfg_t sda;
	gpio_cfg_t rst;
	gpio_cfg_t dc;
	gpio_cfg_t cs;
}oled_cfg_t;


typedef struct {
	uint8 page, col;
	uint8 buff[OLED_COL * OLED_PAGE];
}oled_t;

typedef struct {
	uint8 page_start, col_start, page_size, col_size;
}oled_region_t;

#define region_idx(reg, p, c) (oled->buff[(reg->page_start + p) * OLED_COL + (reg)->col_start + c])

void OLED__init(oled_cfg_t * oc_usr, oled_t * oled_usr);

/**
 * @brief      显示图像区域
 *
 * @param      region       OLED 区域
 * @param      imgroi       图像区域
 * @param[in]  show_margin  是否显示边框
 * @param[in]  flip         是否反色
 */
void OLED__show_img(oled_region_t * region, image_region_t * imgroi, boolean show_margin, boolean flip);

void OLED__show_text(oled_region_t * region, char * text, boolean show_margin, boolean flip);

#endif
