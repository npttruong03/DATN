<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class WebSocketService
{
    private $websocketUrl;

    public function __construct()
    {
        $this->websocketUrl = env('WEBSOCKET_URL', 'http://localhost:6001');
    }

    /**
     * Emit event to WebSocket server
     */
    public function emit($event, $data, $userId = null)
    {
        try {
            $response = Http::post("{$this->websocketUrl}/emit", [
                'event' => $event,
                'data' => $data,
                'userId' => $userId
            ]);

            if ($response->successful()) {
                return true;
            }

            Log::warning('WebSocket emit failed', [
                'event' => $event,
                'response' => $response->body()
            ]);

            return false;
        } catch (\Exception $e) {
            Log::error('WebSocket emit error: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Emit notification to user
     */
    public function emitNotification($userId, $notification)
    {
        try {
            $response = Http::post("{$this->websocketUrl}/emit-notification", [
                'userId' => $userId,
                'notification' => $notification
            ]);

            if ($response->successful()) {
                return true;
            }

            Log::warning('WebSocket notification emit failed', [
                'userId' => $userId,
                'response' => $response->body()
            ]);

            return false;
        } catch (\Exception $e) {
            Log::error('WebSocket notification emit error: ' . $e->getMessage());
            return false;
        }
    }

}

