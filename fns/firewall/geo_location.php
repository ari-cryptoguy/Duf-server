<?php

function calc_distance($lat1, $lon1, $lat2, $lon2, $unit = 'K') {

    $theta = $lon1 - $lon2;
    $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
    $dist = acos($dist);
    $dist = rad2deg($dist);
    $miles = $dist * 60 * 1.1515;
    $unit = strtoupper($unit);

    if ($unit == "K") {
        $miles = ($miles * 1.609344);
        return number_format((float)$miles, 2, '.', '').' Km';
    } else if ($unit == "N") {
        return ($miles * 0.8684).' N';
    } else if ($unit == "M") {
        return $miles.' M';
    }
}