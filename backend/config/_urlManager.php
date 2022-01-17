<?php
return [
    'class' => yii\web\UrlManager::class,
    'enablePrettyUrl' => true,
    'showScriptName' => false,
    'baseUrl' => getenv('BACKEND_HOST_URL'),
    'rules' => [
    ],
];
