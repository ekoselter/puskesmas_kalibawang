<!-- jquery ui js -->
<script type="text/javascript">
	base_url = "<?=base_url();?>";
</script>
<script src="<?=base_url().'aset/web_/';?>assets/js/jquery-ui.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>


<?php if ($_SERVER['CI_ENV'] == 'production') {?>
<script src="<?=base_url();?>dist/bundle.js"></script>
<?php } else { ?>
<script src="<?=base_url();?>dist/bundle.js?v=<?=time();?>"></script>
<?php } ?>

<script type="text/javascript">
  $(".navbar-toggle").each(function(){
      $(this).off("click");
      $(this).on("click", function(){
          $(".fa", this).toggleClass("fa-bars");
          $(".fa", this).toggleClass("fa-times");
          cleanOpen();
      });
  });

</script>