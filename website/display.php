<html>
  <head>
    <meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="./small-style.css" target="_blank">


  </head>
  <body bgcolor="#FFF">

<?php
//mode: list, display, flip
//   echo "../".$_GET["dir"]."/*.*<br>";
//   echo "mode=". $_GET["mode"];
//   echo "flipping=". $_GET["flipping"];
//   echo "display=" . $_GET["display"];
//   echo "width=" . $_GET["width"];
//   echo "height=" . $_GET["height"]."<br>";
//   $backSide=rand(0,5);
//   echo "back=" . $backSide;

if (empty($_GET["mode"])) {
 $mode="flip"; 
}
else {
 $mode=$_GET["mode"];
}

if (empty($_GET["width"])) {
 $width=230; 
}
else {
 $width=$_GET["width"];
}

if (empty($_GET["height"])) {
 $height=330; 
}
else {
 $height=$_GET["height"];
}


   $files = glob("../".$_GET["dir"]."/*.*");
   shuffle($files);
  for ($i=0; $i<count($files); $i++)

{

$image = $files[$i];
$supported_file = array(
    'gif',
    'jpg',
    'jpeg',
    'png',
    'pdf',
    'svg'
);

$ext = strtolower(pathinfo($image, PATHINFO_EXTENSION));
if (in_array($ext, $supported_file)) {

if ($mode=="flip") {
 $backSide = rand(0, 4);
 echo '<iframe frameBorder="0" text-align=center height="'.$height.'" width="'.($width+20).'" src="./card2.php?front='.$image .'&back=back'.$backSide.'.jpg&width='.$width.'&height='.$height.'"></iframe> ';

}

if ($mode=="list") {
 echo '<br> * * * <a href="'.$image.'" target="_blank"><font color=red><b>'.$image.'</b></font>';
}

if ($mode=="display") {
 echo  '<iframe frameBorder="0" text-align=center height='.$height.' width='.$width.' src="'.$image.'"></iframe></a>';
}

if ($mode=="img") {
 echo  ' <a href="'.$image.'"><img height='.$height.' width='.$width.' src="'.$image.'"></a>';
}

} else {
    continue;
 }

}

?>
