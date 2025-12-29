<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use Illuminate\Http\Request;
use App\Models\Variants;

class InventoryController extends Controller
{
    // public function index(Request $request)
    // {
    //     $query = Inventory::with([
    //         'variant' => function ($q) {
    //             $q->select('id', 'color', 'size', 'price', 'sku', 'product_id');
    //             $q->with(['product:id,name']);
    //         }
    //     ]);

    //     if ($request->has('product_id')) {
    //         $variantIds = Variants::where('product_id', $request->product_id)->pluck('id');
    //         $query->whereIn('variant_id', $variantIds);
    //     }

    //     if ($request->has('variant_id')) {
    //         $query->where('variant_id', $request->variant_id);
    //     }

    //     if ($request->has('variant_ids')) {
    //         $query->whereIn('variant_id', $request->variant_ids);
    //     }

    //     if ($request->has('max_quantity')) {
    //         $query->where('quantity', '<=', $request->max_quantity);
    //     }

    //     $inventories = $query->get();

    //     return response()->json($inventories);
    // }

    public function index(Request $request)
    {
        $query = Inventory::with([
            'variant' => function ($q) {
                $q->select('id', 'color', 'size', 'price', 'sku', 'product_id');
                $q->with([
                    'product' => function ($productQuery) {
                        $productQuery->select('id', 'name', 'slug');
                        $productQuery->with('mainImage:id,product_id,image_path,is_main');
                    }
                ]);
            }
        ]);

        // Xử lý product_id, bỏ qua nếu là null hoặc "null"
        if ($request->has('product_id') && $request->product_id !== null && $request->product_id !== 'null') {
            $productId = $request->product_id;
            $variantIds = Variants::where('product_id', $productId)->pluck('id');
            $query->whereIn('variant_id', $variantIds);
        }

        if ($request->has('variant_id')) {
            $query->where('variant_id', $request->variant_id);
        }

        if ($request->has('variant_ids')) {
            $query->whereIn('variant_id', $request->variant_ids);
        }

        if ($request->has('max_quantity')) {
            $query->where('quantity', '<=', $request->max_quantity);
        }

        $inventories = $query->get();

        $variantIdsInInventory = $inventories->pluck('variant_id')->toArray();

        $variantsWithoutInventory = Variants::with([
            'product' => function ($productQuery) {
                $productQuery->select('id', 'name', 'slug');
                $productQuery->with('mainImage:id,product_id,image_path,is_main');
            }
        ])
            ->whereNotIn('id', $variantIdsInInventory)
            ->when($request->has('product_id') && $request->product_id !== null && $request->product_id !== 'null', function ($q) use ($request) {
                $q->where('product_id', $request->product_id);
            })
            ->get();

        $fakeInventories = $variantsWithoutInventory->map(function ($variant) {
            $inventory = new Inventory();
            $inventory->id = null;
            $inventory->variant_id = $variant->id;
            $inventory->quantity = 0;
            $inventory->setRelation('variant', $variant);
            return $inventory;
        });

        $allInventories = $inventories->merge($fakeInventories);

        // Thêm thông tin ảnh sản phẩm vào response cho AI
        $allInventories = $allInventories->map(function ($inventory) {
            if ($inventory->variant && $inventory->variant->product) {
                $product = $inventory->variant->product;
                
                // Thêm main_image_url nếu có mainImage
                if ($product->mainImage && $product->mainImage->image_path) {
                    $imagePath = $product->mainImage->image_path;
                    if (!str_starts_with($imagePath, 'storage/') && !str_starts_with($imagePath, '/storage/')) {
                        $imagePath = 'storage/' . ltrim($imagePath, '/');
                    }
                    $product->main_image_url = url($imagePath);
                } else {
                    $product->main_image_url = null;
                }
            }
            return $inventory;
        });

        return response()->json($allInventories);
    }
}
