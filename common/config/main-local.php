<?php
return [
    'components' => [
        'db' => [
            'class' => yii\db\Connection::class,
            'dsn' => getenv('DB_DSN'),
//            'username' => getenv('DB_USERNAME'),
//            'password' => getenv('DB_PASSWORD'),
            'username' => 'root',
            'password' => 'password',
            'tablePrefix' => getenv('DB_TABLE_PREFIX'),
            'charset' => getenv('DB_CHARSET', 'utf8'),
            'enableSchemaCache' => getenv('YII_ENV'),
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
    ],
];
