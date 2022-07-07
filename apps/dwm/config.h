/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  =0;//= 4;        /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const unsigned int snap      = 4;        /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int scalepreview       = 4;        /* Tag preview scaling */
static const char *fonts[]          = { "Hack:size=14" };  // 14,18
static const char col_gray1[]       = "#2e3440";
static const char col_gray2[]       = "#81a1c1";
static const char col_gray3[]       = "#81a1c1";
static const char col_gray4[]       = "#88c0d0"; 
static const char col_cyan[]        = "#4c566a";
static const char urgbordercolor[]  = "#bf616a";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_cyan },
	[SchemeSel]  = { col_gray4, col_cyan,  col_gray2  },
	[SchemeHid]  = { col_cyan,  col_gray1, col_cyan  },
};

/* tagging */
static const char *tags[] = { "●", "●", "●", "●", "●", "●", "●", "●"}; // ⚃ ●
static const char *alttags[][8] = {
  { "α", "β", "γ", "δ", "ε", "ζ", "η", "θ" },
  { "一", "二", "三", "四", "五", "六", "七", "八" },
};
static const char **alttags_current = alttags[0];

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       0,            0,           -1 },
  { "Microsoft Teams Notification",  NULL,       NULL,       0,            1,           -1 },
  { "zoom",     NULL,       NULL,       0,            1,           -1 },
  { "microsoft teams - preview",  NULL,       NULL,       0,            1,           -1 },
  { "Counter-Strike: Global Offensive - OpenGL", NULL, NULL, 0, 0, -1},
};

/* layout(s) */
static const float mfact     = 0.5; //.5025 /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */  // used to be 1

static const Layout layouts[] = {
	/* symbol     arrange function */
  /* first entry is default */
  /* no layout function means floating behavior */
  { "[M]",     monocle },
	{ "[]",      tile },
	{ "<>",      NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define PrintScreenDWM 0x0000ff61
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      comboview,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      combotag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const Arg termcmd  = SHCMD("st -e tmux new-session -A -s MAIN");

static Key keys[] = {
  /* modifier                     key        function        argument */
  { MODKEY,                       XK_s,      spawn,          SHCMD("rofi -show run") },  // Search programs
  { MODKEY|ShiftMask,             XK_t,      spawn,          termcmd },  // Main terminal
  { MODKEY|ControlMask,           XK_t,      spawn,          termcmd },  // Main terminal
  { MODKEY|ShiftMask,             XK_n,      spawn,          SHCMD("st -e tmux") },  // Fresh terminal
  { MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("st -e ipython3") },  // ipython window
  { MODKEY|ShiftMask,             XK_q,      spawn,          SHCMD("powermenu") },  // powermenu
  { MODKEY,                       XK_b,      togglebar,      {0} },  // Toggle the status bar
  { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },  // Rotate focus
  { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },  // Rotate focus
  { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },  // Increment on left
  { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },  // Decrement on left
  { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },  // Shift size of master
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },  // Shift size of master
  { MODKEY|ShiftMask,             XK_l,      spawn,          SHCMD("menu") },  // Script menu
  { MODKEY|ShiftMask,             XK_j,      swaptags,       {}},  // Swap alttags
  { MODKEY,                       XK_Return, zoom,           {0} },  // Swap focus
  { 0,                            PrintScreenDWM, spawn,     SHCMD("printscreen") },  // print screen
  { MODKEY,                       XK_Tab,    spawn,          SHCMD("rofi -show windowcd") },  // Window switcher
  { MODKEY|ShiftMask,             XK_s,      spawn,          SHCMD("rofi -show ssh") },  // SSH Menu
  { MODKEY|ShiftMask,             XK_w,      killclient,     {0} },  // Close window
  { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[1]} },  // Tiling mode
  { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },  // Floating mode
  { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[0]} },  // Monicle mode
  { MODKEY,                       XK_space,  setlayout,      {0} },  // Swap layout mode
  { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },  // Toggle floating on focused window
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },  // View all tags
  { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },  // Give window every tag
  { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },  // Decrement monitor focus
  { MODKEY,                       XK_period, focusmon,       {.i = +1 } },  // Increment monitor focus
  { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },  // Move window down monitor
  { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },  // Move window up monitor
  { MODKEY|ControlMask,           XK_4,      spawn,          SHCMD("screenshot_clip") },  // Screenshot (like macos)
  TAGKEYS(                        XK_1,                      0)
  TAGKEYS(                        XK_2,                      1)
  TAGKEYS(                        XK_3,                      2)
  TAGKEYS(                        XK_4,                      3)
  TAGKEYS(                        XK_5,                      4)
  TAGKEYS(                        XK_6,                      5)
  TAGKEYS(                        XK_7,                      6)
  TAGKEYS(                        XK_8,                      7)
  TAGKEYS(                        XK_9,                      8)
  { MODKEY|ControlMask,           XK_q,      quit,           {1} },  // Restart DWM (keeps windows)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
// TODO - figure out why this doesn't work
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          termcmd },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

/* signal definitions */
/* signum must be greater than 0 */
/* trigger signals using `xsetroot -name "fsignal:<signum>"` */
static Signal signals[] = {
	/* signum       function        argument  */
	{ 1,            quit,           {0} },  // Logout
	{ 2,            quit,           {1} },  // Restart DWM (keep windows open)
};
