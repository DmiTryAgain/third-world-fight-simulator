<?php
return [
    'class' => yii\web\UrlManager::class,
    'enablePrettyUrl' => true,
    'showScriptName' => false,
    'baseUrl' => getenv('FRONTEND_HOST_URL'),
    'rules' => [
        ['pattern' => '/', 'route' => 'site/index'],
    ],
];
