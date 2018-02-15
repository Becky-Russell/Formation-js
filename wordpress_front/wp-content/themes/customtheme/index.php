<?php get_header(); ?>
<?php
// La boucle de wordpress (la wordpress loop) permet d'afficher un ou plusieurs contenus selon la page visitée.
// Si la page en question affiche seulement un article cette boucle ne sera parcourie qu'in seule fois. 
// Sur une page contenant une liste d'article, elle sera parcourue autant de fois qu'il y a d'articles.

while(have_posts()) : // while (si < $nbposts) en gros
    the_post(); //$i++ en gros toujours
    if(is_front_page() && is_home()) : ?>
        <h2><?php the_title() ?></h2>
<?php else: ?>
        <h1><?php the_title() ?></h1>
<?php endif; ?>

<article>
    <?php the_content(); ?>
</article>

<?php 
the_posts_pagination( array(
				'prev_text'          => __( 'Previous page', 'twentyfifteen' ),
				'next_text'          => __( 'Next page', 'twentyfifteen' ),
				'before_page_number' => '<span class="meta-nav screen-reader-text">' . __( 'Page', 'twentyfifteen' ) . ' </span>',
            ) );
            ?>
<?php endwhile;?>
<?php get_footer(); ?>