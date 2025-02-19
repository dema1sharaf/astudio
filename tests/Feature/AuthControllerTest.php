<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AuthControllerTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_user_can_register_successfully()
    {
        $response = $this->postJson('/api/register', [
            'first_name' => 'Hana',
            'last_name' => 'New',
            'email' => 'Hana@gmail.com',
            'password' => '123456',
            'password_confirmation' => '123456',
        ]);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'message',
                'user' => ['id', 'first_name', 'last_name', 'email'],
                'token'
            ]);

        $this->assertDatabaseHas('users', ['email' => 'Hana@gmail.com']);
    }

    public function test_registration_fails_with_duplicate_email()
    {
        User::factory()->create(['email' => 'existing@gmail.com']);

        $response = $this->postJson('/api/register', [
            'first_name' => 'Test',
            'last_name' => 'User',
            'email' => 'existing@gmail.com',
            'password' => '123456',
            'password_confirmation' => '123456',
        ]);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['email']);
    }

    public function test_logout_fails_without_token()
    {
        $response = $this->postJson('/api/logout');

        $response->assertStatus(401);
    }

}
