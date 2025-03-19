<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use OpenApi\Attributes as OA;

class ApiTestController
{
    #[Route('/api/test', name: 'api_test', methods: ['GET', 'OPTIONS'])]
    #[OA\Get( 
        path: '/api/test',
        summary: 'Test de connexion avec Vue.js',
        responses: [
            new OA\Response(
                response: 200,
                description: 'Retourne un message de succès',
                content: new OA\JsonContent(
                    type: 'object',
                    properties: [
                        new OA\Property(property: 'message', type: 'string', example: 'Communication avec Vue.js réussie !')
                    ]
                )
            )
        ]
    )]
    public function test()
    {
        return new JsonResponse([
            'message' => 'Communication avec Vue.js réussie !'
        ]);
    }

    #[Route('/api/test', name: 'api_test_options', methods: ['OPTIONS'])]
    public function options()
    {
        return new Response(null, 200);
    }
}