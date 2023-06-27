<?php
$result = false;
if (isset($data['file']) && !empty($data['file'])) {

    if (!isset($data['quality'])) {
        $data['quality'] = 50;
    }

    if (!is_array($data['file'])) {
        $data['file'] = array($data['file']);
    }

    foreach ($data['file'] as $convert_img) {
        if (isset($data['real_path']) && $data['real_path']) {
            $image = $saveas = $convert_img;
            if (isset($data['saveas']) && !empty($data['saveas'])) {
                $saveas = $data['saveas'];
            }
        } else {
            $image = $saveas = 'assets/files/'.$convert_img;
            if (isset($data['saveas']) && !empty($data['saveas'])) {
                $saveas = 'assets/files/'.$data['saveas'];
            }

        }

        if (file_exists($image)) {
            $quality = $data['quality'];
            $image_type = mime_content_type($image);

            if ($image_type === 'image/jpeg' || $image_type === 'image/png' || $image_type === 'image/gif' || $image_type === 'image/bmp' || $image_type === 'image/x-ms-bmp') {
                list($width, $height) = getimagesize($image);
                switch ($image_type) {
                    case 'image/bmp': $img = @imagecreatefrombmp($image); break;
                    case 'image/x-ms-bmp': $img = @imageCreateFromBmp($image); break;
                    case 'image/gif': $img = @imagecreatefromgif($image); break;
                    case 'image/jpeg': $img = @imagecreatefromjpeg($image); break;
                    case 'image/webp': $img = @imagecreatefromwebp($image); break;
                    case 'image/png': $img = @imagecreatefrompng($image); break;
                    default : return false;
                    }

                    $new = imagecreatetruecolor($width, $height);

                    if ($image_type === "image/gif" || $image_type === "image/png") {
                        imagealphablending($new, false);
                        imagesavealpha($new, true);
                        $transparent_layer = imagecolorallocatealpha($new, 0, 0, 0, 127);
                        imagefilledrectangle($new, 0, 0, $width - 1, $height - 1, $transparent_layer);
                    }

                    imagecopy($new, $img, 0, 0, 0, 0, $width, $height);
                    imagewebp($new, $saveas, $quality);
                    imagedestroy($img);
                    imagedestroy($new);

                    if (file_exists($saveas)) {
                        $result = true;
                    }
                }

            }
        }
    }
    ?>