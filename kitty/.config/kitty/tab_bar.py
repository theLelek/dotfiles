import os
from kitty.tab_bar import draw_title


def draw_tab(
    is_active,
    is_last,
    draw,
    tab,
    max_title_length,
    index,
    extra_data,
):
    cwd = tab.active_wd or ""
    cwd = os.path.basename(cwd.rstrip("/")) or "~"

    # fallback if root or empty
    if not cwd:
        cwd = "~"

    prefix = "█ " if is_active else "  "
    suffix = " █" if is_active else ""

    draw(prefix + cwd + suffix)
