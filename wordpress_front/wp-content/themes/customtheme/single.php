<?php get_header(); ?>
<?php while(have_post()): the_post(); ?>

<article>
    <header>
        <h1><?php the_title();?></h1>
    </header>
    <div class="content">
    <?php the_content();?>
    </div>

<footer>
<?php 
the_posts_pagination( array(
				'prev_text'          => __( 'Previous page', 'twentyfifteen' ),
				'next_text'          => __( 'Next page', 'twentyfifteen' ),
				'before_page_number' => '<span class="meta-nav screen-reader-text">' . __( 'Page', 'twentyfifteen' ) . ' </span>',
            ) );
            ?>

</footer>
</article>
    <?pho endwhile;?>
<?php get_footer(); ?>