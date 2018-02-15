<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress_front');

/** MySQL database username */
define('DB_USER', 'wordpress_front');

/** MySQL database password */
define('DB_PASSWORD', 'wordpress_front');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '*?HiSX#?N;kkSJiOP?22lPv?C>C}50GgZ2.Sx]?]Mjw^l?Q9BHj`V3:Fj_2PZD0=');
define('SECURE_AUTH_KEY',  'i}TMjuhMbTxH1,Rh90oJ;h}eDvD4jI/9CL}4-Ru*^~{06u4LGw_BlX5<:|foO8,I');
define('LOGGED_IN_KEY',    '!g&2d5keX!3mlQTo(+Vix16/KDnSo<0>V/W{Febel>4Q<N 81VKjFx<@Kd@y$Ggk');
define('NONCE_KEY',        'aj08[qQ&Efz*7=f<eVD$%L7F`O*PoOZ$91pdD5my0S@!:GdSEObUZ@<BY)m{N$|o');
define('AUTH_SALT',        'c8O-vo/xW<1OI-NQg>b9|X4yJC#F9<wfqA$CQ.<::#8CYyE2$cUP24l)Ph^lXA8]');
define('SECURE_AUTH_SALT', 'sh@HP7{Z+i<xSr|J<<K5kl].kXI]56P.B}u@N@Ak%FyX0FKh.2NY+47`vlSn8td7');
define('LOGGED_IN_SALT',   'g|u!3Ur-eH:N!x-7#R?4rVsWv9c:BX2O6ZG?YX4(a_qo@0avGtmOp=xy&IpVEI6D');
define('NONCE_SALT',       ' kGh.rO9UEmT&!~d(Frd`aoR<y~??~pzD}gZ22xp@4UM1cLJ{.cC]g:@qT2R*P]H');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
