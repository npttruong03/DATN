<?php

namespace App\Observers;

use Illuminate\Notifications\DatabaseNotification;
use App\Services\WebSocketService;

class NotificationObserver
{
    protected $websocketService;

    public function __construct(WebSocketService $websocketService)
    {
        $this->websocketService = $websocketService;
    }

    /**
     * Handle the notification "created" event.
     */
    public function created(DatabaseNotification $notification)
    {
        // Get the notifiable user ID
        // Laravel notifications use morphs, so we need to get from notifiable relationship
        $notifiable = $notification->notifiable;
        $userId = $notifiable ? $notifiable->id : $notification->notifiable_id;
        
        if (!$userId) {
            \Log::warning('Cannot get user ID from notification', [
                'notification_id' => $notification->id
            ]);
            return;
        }
        
        // Prepare notification data
        $notificationData = [
            'id' => $notification->id,
            'type' => $notification->type,
            'data' => $notification->data,
            'read_at' => $notification->read_at,
            'created_at' => $notification->created_at?->toDateTimeString(),
        ];

        // Emit via WebSocket
        try {
            $this->websocketService->emitNotification($userId, $notificationData);
            \Log::info('Notification emitted via WebSocket', [
                'user_id' => $userId,
                'notification_id' => $notification->id
            ]);
        } catch (\Exception $e) {
            \Log::error('Failed to emit notification via WebSocket: ' . $e->getMessage(), [
                'user_id' => $userId,
                'notification_id' => $notification->id,
                'trace' => $e->getTraceAsString()
            ]);
        }
    }
}

