<?php

namespace Tests\Feature;

use App\Models\Attribute;
use App\Models\Project;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ProjectControllerTest extends TestCase
{

    protected function setUp(): void
    {
        parent::setUp();

        // Create a user and authenticate for all tests
        $this->user = User::factory()->create();
        $this->actingAs($this->user, 'api'); // Ensure user is authenticated
    }

    /** @test */
    public function it_validates_required_fields_when_creating_a_project()
    {
        $response = $this->postJson('/api/projects', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['name', 'status']);
    }

    /** @test */
    public function it_can_create_a_project_with_attributes()
    {
        $attribute = Attribute::factory()->create();

        $payload = [
            'name' => 'Test Project',
            'status' => 'active',
            'attributes' => [
                ['id' => $attribute->id, 'value' => 'IT Department']
            ],
        ];

        $response = $this->postJson('/api/projects', $payload);

        $response->assertStatus(201)
            ->assertJson([
                'message' => 'Project created successfully',
                'project' => ['name' => 'Test Project']
            ]);

        $this->assertDatabaseHas('projects', ['name' => 'Test Project']);
        $this->assertDatabaseHas('attribute_values', ['value' => 'IT Department']);
    }


    /** @test  */
    public function it_returns_404_if_project_not_found()
    {
        $response = $this->getJson('/api/projects/999');

        $response->assertStatus(404);
    }

    /** @test */
    public function it_can_filter_projects_by_name()
    {
        Project::factory()->create(['name' => 'Project Alpha']);
        Project::factory()->create(['name' => 'Project Beta']);

        $response = $this->getJson('/api/projects?filters[name]=LIKE:%Alpha%');

        $response->assertStatus(200)
            ->assertJsonCount(1)
            ->assertJsonFragment(['name' => 'Project Alpha']);
    }

}
