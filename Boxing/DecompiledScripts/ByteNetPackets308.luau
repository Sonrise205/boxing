local l_ByteNet_0 = require(game.ReplicatedFirst:WaitForChild("ByteNet"));
return l_ByteNet_0.defineNamespace("Catalog", function() --[[ Line: 3 ]]
    -- upvalues: l_ByteNet_0 (copy)
    local v1 = l_ByteNet_0.struct({
        name = l_ByteNet_0.string, 
        id = l_ByteNet_0.optional(l_ByteNet_0.string), 
        price = l_ByteNet_0.optional(l_ByteNet_0.uint16), 
        assetType = l_ByteNet_0.optional(l_ByteNet_0.uint8), 
        isBundle = l_ByteNet_0.optional(l_ByteNet_0.bool), 
        isLimited = l_ByteNet_0.optional(l_ByteNet_0.bool), 
        blob = l_ByteNet_0.optional(l_ByteNet_0.string), 
        bundleId = l_ByteNet_0.optional(l_ByteNet_0.string)
    });
    return {
        SearchQuery = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                tab = l_ByteNet_0.int8, 
                subtab = l_ByteNet_0.int8, 
                searchText = l_ByteNet_0.string, 
                nextPageCursors = l_ByteNet_0.optional(l_ByteNet_0.array(l_ByteNet_0.string))
            })
        }), 
        ReturnResults = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                nextPageCursors = l_ByteNet_0.optional(l_ByteNet_0.array(l_ByteNet_0.string)), 
                items = l_ByteNet_0.array(v1)
            })
        }), 
        TryItem = l_ByteNet_0.definePacket({
            value = v1
        }), 
        FavoriteItem = l_ByteNet_0.definePacket({
            value = v1
        }), 
        DirectSearch = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                id = l_ByteNet_0.string, 
                isBundle = l_ByteNet_0.optional(l_ByteNet_0.bool)
            })
        }), 
        GetRecentItems = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                items = l_ByteNet_0.array(v1)
            })
        }), 
        GetFavorites = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                items = l_ByteNet_0.array(v1)
            })
        }), 
        UpdateAppearance = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.bool
        }), 
        ResetAppearance = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.bool
        }), 
        UpdateBodyColor = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                target = l_ByteNet_0.int8, 
                colorId = l_ByteNet_0.uint16
            })
        }), 
        DeleteOutfit = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.string
        }), 
        LoadSavedOutfit = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.string
        }), 
        LoadOutfitFromBlob = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.string
        }), 
        SaveOutfit = l_ByteNet_0.definePacket({
            value = v1
        }), 
        GetOutfits = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.struct({
                items = l_ByteNet_0.array(v1)
            })
        }), 
        PromptOutfitPurchase = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.string
        }), 
        PromptPotentialBundlePurchase = l_ByteNet_0.definePacket({
            value = l_ByteNet_0.string
        })
    };
end);