<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use OpenApi\Attributes as OA;
use Nelmio\ApiDocBundle\Annotation\Model;

class ApiTestController
{
    #[Route('/api/test', name: 'api_test', methods: ['GET'])]
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
            // Retourne la réponse CORS pour OPTIONS
    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        return new Response('', Response::HTTP_OK);
    }

        return new JsonResponse([
            'message' => 'Communication avec Vue.js réussie !'
        ]);
    }
}