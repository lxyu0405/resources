<?php
/**
 * Created by PhpStorm.
 * User: xiaoyu.lu
 * Date: 2018-12-13
 * Time: 22:59
 */
$svgTemplate = <<<EOD
<?xml version="1.0" encoding="utf-8"?>
<svg version="1.1" id="%name%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="%width%px" height="%height%px" viewBox="0 0 %width% %height%">
%paths%
</svg>
EOD;

    $jsContent = file_get_contents('china_ad_map.js');

    $replaces = [
        '%width%' => '',
        '%height%' => '',
        '%name%' => '',
        '%paths%' => '',
    ];

    // Parse the relevant parts of the JS file
    preg_match('/width[\'"]?\s*:\s*[\'"]?([0-9]+\.?[0-9]*)/s', $jsContent, $matches);
    if (count($matches) > 0) {
        $replaces['%width%'] = $matches[1];
    }

    preg_match('/height[\'"]?\s*:\s*[\'"]?([0-9]+\.?[0-9]*)/s', $jsContent, $matches);
    if (count($matches) > 0) {
        $replaces['%height%'] = $matches[1];
    }

    preg_match('/maps[\'"]?\s*:\s*{\s*[\'"]?([a-zA-Z0-9-_]+)/s', $jsContent, $matches);
    if (count($matches) > 0) {
        $replaces['%name%'] = $matches[1];
    }

    $paths = null;
    preg_match('/elems[\'"]?\s*:\s*{(.*)}/sU', $jsContent, $matches);
    if (count($matches) > 0) {
        $paths = json_decode('{' . $matches[1] . '}', true);
    }

    if (is_array($paths) && count($paths) > 0) {
        foreach($paths as $id => $data) {
            $replaces['%paths%'] .= '<path id="' . $id . '" fill-rule="evenodd" clip-rule="evenodd" fill="#E0E0E0" d="' . $data . '" />'  . PHP_EOL;
        }
    }

    $svgContent = strtr($svgTemplate, $replaces);

    echo $svgContent;

?>