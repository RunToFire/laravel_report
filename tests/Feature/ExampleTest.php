<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ExampleTest extends TestCase
{
    /**
     * @assert (0, 0) == 0
     * @assert (0, 1) == 1
     * @assert (1, 0) == 1
     * @assert (1, 1) == 3
     */
    public function sum($a, $b)
    {
        return $a + $b;
    }
    /**
     * A basic test example.
     * @assert (0, 0) == 0.
     * @return void
     */
    public function testBasicTest()
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function testSumTest() {
        $this->assertEquals(0, $this->sum(1, 0));
    }
}
