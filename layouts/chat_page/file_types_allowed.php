<?php
$audio_file_formats = ['audio/wav', 'audio/mpeg', 'audio/mp4', 'audio/webm', 'audio/ogg', 'audio/x-wav'];

$image_file_formats = ['image/jpeg', 'image/png', 'image/x-png', 'image/gif', 'image/bmp', 'image/x-ms-bmp', 'image/webp'];

$video_file_formats = ['video/mp4', 'video/mpeg', 'video/ogg', 'video/webm', 'video/3gpp', 'video/mp4', 'video/mpeg', 'video/ogg',
    'video/quicktime', 'video/webm', 'video/x-m4v', 'video/ms-asf', 'video/x-ms-wmv', 'video/x-msvideo'];

$doc_file_formats = ['text/comma-separated-values', 'application/msword', 'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.template',
    'application/pdf', 'application/mspowerpoint', 'application/vnd.ms-powerpoint', 'application/mspowerpoint',
    'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'application/mspowerpoint', 'application/mspowerpoint', 'text/rtf', 'text/plain', 'application/msexcel', 'application/vnd.ms-excel',
    'application/msexcel', 'application/vnd.ms-excel', 'application/msexcel', 'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.template', 'application/vnd.ms-excel',
    'application/vnd.oasis.opendocument.spreadsheet', 'application/vnd.oasis.opendocument.spreadsheet-template',
    'application/vnd.oasis.opendocument.presentation-template'];

$input_accept_attribute = array();

if (!role(['permissions' => ['allowed_file_formats' => 'all_file_formats']])) {
    if (role(['permissions' => ['allowed_file_formats' => 'image_files']])) {
        $input_accept_attribute = array_merge($input_accept_attribute, $image_file_formats);
    }

    if (role(['permissions' => ['allowed_file_formats' => 'video_files']])) {
        $input_accept_attribute = array_merge($input_accept_attribute, $video_file_formats);
    }

    if (role(['permissions' => ['allowed_file_formats' => 'audio_files']])) {
        $input_accept_attribute = array_merge($input_accept_attribute, $audio_file_formats);
    }

    if (role(['permissions' => ['allowed_file_formats' => 'documents']])) {
        $input_accept_attribute = array_merge($input_accept_attribute, $doc_file_formats);
    }
}
if (!empty($input_accept_attribute)) {
    Registry::load('current_user')->allowed_file_types = implode(",", $input_accept_attribute);
}
?>