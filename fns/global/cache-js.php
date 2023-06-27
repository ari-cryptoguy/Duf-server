<?php

require_once 'fns/minify/load.php';
use MatthiasMullie\Minify;


foreach (glob("assets/js/combined_js_"."*.*") as $old_cache_file) {
    unlink($old_cache_file);
}

$js_files = [
    'assets/thirdparty/jquery/jquery-min.js',
    'assets/thirdparty/jquery/jquery-after-load.js',
    'assets/thirdparty/bootstrap/bootstrap.bundle.min.js',
    'assets/thirdparty/jquery.lazy/jquery.lazy.min.js',
    'assets/thirdparty/jquery.marquee/jquery.marquee.min.js',
    'assets/thirdparty/recordrtc/recordrtc.min.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_chat_page_libraries.js';
$minifier->minify($minifiedPath);

$js_files = [
    'assets/thirdparty/colorpicker/dist/js/bootstrap-colorpicker.min.js',
    'assets/thirdparty/summernote/summernote.min.js'
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_chat_page_libraries_2.js';
$minifier->minify($minifiedPath);


$js_files = [
    'assets/thirdparty/codemirror/lib/codemirror.js',
    'assets/thirdparty/codemirror/mode/xml/xml.js',
    'assets/thirdparty/codemirror/mode/javascript/javascript.js',
    'assets/thirdparty/codemirror/mode/css/css.js',
    'assets/thirdparty/codemirror/mode/clike/clike.js',
    'assets/thirdparty/codemirror/mode/php/php.js',
    'assets/thirdparty/codemirror/mode/htmlmixed/htmlmixed.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_chat_page_libraries_3.js';
$minifier->minify($minifiedPath);


$js_files = [
    'assets/js/chat_page/main.js',
    'assets/js/chat_page/aside.js',
    'assets/js/chat_page/middle.js',
    'assets/js/chat_page/form.js',
    'assets/js/chat_page/audio_player.js',
    'assets/js/chat_page/info_box.js',
    'assets/js/chat_page/grid_list.js',
    'assets/js/chat_page/audio_message.js',
    'assets/js/chat_page/messages.js',
    'assets/js/chat_page/message_editor.js',
    'assets/js/chat_page/geolocation_system.js',
    'assets/js/chat_page/statistics.js',
    'assets/js/common/api_request.js',
    'assets/js/chat_page/realtime.js',
    'assets/js/common/custom_js.js',
    'assets/js/chat_page/custom_js.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_chat_page.js';
$minifier->minify($minifiedPath);


$js_files = [
    'assets/js/chat_page/emojis.js',
    'assets/thirdparty/videojs/video.min.js',
    'assets/thirdparty/viewerjs/viewer.min.js',
    'assets/thirdparty/viewerjs/jquery-viewer.js',
    'assets/thirdparty/videojs/youtube.min.js',
    'assets/thirdparty/videojs/dailymotion.min.js',
    'assets/thirdparty/videojs/vimeo.min.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_chat_page_after_load.js';
$minifier->minify($minifiedPath);


$js_files = [
    'assets/thirdparty/jquery/jquery-min.js',
    'assets/thirdparty/bootstrap/bootstrap.bundle.min.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_entry_page_libraries.js';
$minifier->minify($minifiedPath);


$js_files = [
    'assets/js/entry_page/script.js',
    'assets/js/common/api_request.js',
    'assets/js/common/custom_js.js',
    'assets/js/entry_page/custom_js.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_entry_page.js';
$minifier->minify($minifiedPath);


$js_files = [
    'assets/thirdparty/jquery/jquery-min.js',
    'assets/thirdparty/bootstrap/bootstrap.bundle.min.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_landing_page_libraries.js';
$minifier->minify($minifiedPath);

$js_files = [
    'assets/js/landing_page/script.js',
    'assets/js/common/api_request.js',
    'assets/js/common/custom_js.js',
    'assets/js/landing_page/custom_js.js',
];

$minifier = new Minify\JS();
$minifier->add($js_files);

$minifiedPath = 'assets/js/combined_js_landing_page.js';
$minifier->minify($minifiedPath);

$result = true;