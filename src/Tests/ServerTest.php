<?php

/**
 * Class ServerTest
 */
class ServerTest extends PHPUnit_Framework_TestCase
{
    public function testServer()
    {
        $server = new \Confessor\Client();
        $server->send("mega test of communication");
    }
}
