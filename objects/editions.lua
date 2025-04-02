SMODS.Shader {
  key = 'trans',
  path = 'trans.fs'
}

SMODS.Edition {
  key = 'trans',
  shader = 'trans',
  config = {
    amount = 1
  },
  sound = {
    sound = 'polychrome1',
    per = 1,
    vol = 0.4
  },
  discovered = true,
  weight = 3,     -- As rare as polychrome
  in_shop = true,
  extra_cost = 5, -- As expensive as polychrome

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        (card.edition or {}).amount or self.config.amount
      }
    }
  end,
}

-- Prevent Dichrome edition being added to non-jokers
local poll_edition_ref = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
  local removed, pos

  if _no_neg then
    for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
      if v.key == 'e_paperback_dichrome' then
        pos = i
        removed = table.remove(G.P_CENTER_POOLS.Edition, i)
        break
      end
    end
  end

  local ret = poll_edition_ref(_key, _mod, _no_neg, _guaranteed, _options)

  if _no_neg and removed and pos then
    table.insert(G.P_CENTER_POOLS.Edition, pos, removed)
  end

  return ret
end
