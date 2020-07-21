/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int gappx     = 6; /* gaps between windows */
static const unsigned int snap      = 8;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 2; // inside padding
static const int vertpadbar         = 0; // inside padding
static const int vertpad            = 12; // outside padding
static const int sidepad            = 8; // outside padding
static const char *fonts[]          = { "Hack:size=14" };  // 14,18
static const char dmenufont[]       = "Hack:size=14";
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
};

/* tagging */
static const char *tags[] = { "●", "●", "●", "●", "●", "●", "●", "●"}; // ⚃ ●

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
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */  // used to be 1

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]",      tile },    /* first entry is default */
	{ "<>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
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
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run_conf", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *roficmd[] = { "rofi", "-show", "run", NULL };
static const char *pythoncmd[] = { "st", "-e", "ipython3", NULL};
static const char *termcmd[]  = { "st", "-e", "tmux", "new-session", "-A", "-s", "MAIN", NULL };
static const char *newtermcmd[]  = { "st", "-e", "tmux",NULL };
static const char *windowcmd[] = { "rofi", "-show", "window", NULL};
static const char *windowcdcmd[] = { "rofi", "-show", "windowcd", NULL};
static const char *sshcmd[] = { "rofi", "-show", "ssh", NULL};
static const char *lockscreencmd[] = { "/home/harrison/config/scripts/lockscreen", NULL};
static const char *powercmd[] = { "/home/harrison/config/scripts/powermenu", NULL};
static const char *printscreencmd[] = { "/home/harrison/config/scripts/printscreen", NULL};

static Key keys[] = {
  /* modifier                     key        function        argument */
  { MODKEY,                       XK_s,      spawn,          {.v = roficmd } },  // search
  { MODKEY|ShiftMask,             XK_t,      spawn,          {.v = termcmd } },  // terminal
  { MODKEY|ControlMask,           XK_t,      spawn,          {.v = termcmd } },  // terminal
  { MODKEY|ShiftMask,             XK_n,      spawn,          {.v = newtermcmd } },  // terminal
  { MODKEY|ShiftMask,             XK_p,      spawn,          {.v = pythoncmd } },  // ipython window
  { MODKEY|ShiftMask,             XK_q,      spawn,          {.v = powercmd} },  // powermenu
  { MODKEY,                       XK_b,      togglebar,      {0} },  // toggle the status bar
  { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },  // Rotate focus
  { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },  // Rotate focus
  { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },  // 
  { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },  // 
  { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },  // Shift size of master
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },  // Shift size of master
  { MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockscreencmd} },  // lockscreen
  { MODKEY,                       XK_Return, zoom,           {0} },  // ?
/*{ MODKEY,                       XK_Tab,    view,           {0} },*/
  { 0,                            PrintScreenDWM, spawn,     {.v = printscreencmd} },  // print screen
  { MODKEY,                       XK_Tab,    spawn,          {.v = windowcmd} },  // window switcher
  { MODKEY|ShiftMask,             XK_s,      spawn,          {.v = sshcmd} },  // ssh holder
  { MODKEY|ShiftMask,             XK_w,      killclient,     {0} },  // close window
  { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },  // tiling mode
  { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },  // floating mode
  { MODKEY,                       XK_F,      togglefloating, {0} },  // ?
  { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },  // monicle mode
  { MODKEY,                       XK_space,  setlayout,      {0} },  // change layout back
  { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },  // ?
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },  // view all tags
  { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },  // give window every tag
  { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
  { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
  { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },  // shift focus betweeen monitors
  { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },  // shift focus betweeen monitors
  TAGKEYS(                        XK_1,                      0)
  TAGKEYS(                        XK_2,                      1)
  TAGKEYS(                        XK_3,                      2)
  TAGKEYS(                        XK_4,                      3)
  TAGKEYS(                        XK_5,                      4)
  TAGKEYS(                        XK_6,                      5)
  TAGKEYS(                        XK_7,                      6)
  TAGKEYS(                        XK_8,                      7)
  TAGKEYS(                        XK_9,                      8)
  /*{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },  // close dwm */
  { MODKEY|ControlMask,           XK_q,      quit,           {1} },  // restart dwm (keep apps open)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

