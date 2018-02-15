<?php 
function customtheme_setup() {
    // 
   
    // This theme uses wp_nav_menu() in two locations.
    
    /**
     * Traduction du tableau suivant en JS en quelque sorte : 
     * registerNavMenus({
     * primary: traduire('Primary Menu', 'twentyfiteen'),
     * social : traduire('Social Links Menu', 'twentyfifteen')
     * })
     */

    register_nav_menus( array(
		'primary' => __( 'Primary Menu', 'twentyfifteen' ),
		'social'  => __( 'Social Links Menu', 'twentyfifteen' ),
	) );

}

add_action('after_setup_theme', 'customtheme_setup');


function twentyfifteen_widgets_init() {
	register_sidebar( array(
		'name'          => __( 'Widget Area', 'twentyfifteen' ),
		'id'            => 'sidebar-1',
		'description'   => __( 'Add widgets here to appear in your sidebar.', 'twentyfifteen' ),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'customtheme_widgets_init' );


?>
