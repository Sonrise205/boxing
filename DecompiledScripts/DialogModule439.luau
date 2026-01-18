local v0 = false;
local v1;
if game:GetService("RunService"):IsClient() then
    v1 = shared.BridgeNet2;
    if not v1 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v1 = shared.BridgeNet2;
        v0 = v1;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v1 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v2 = v1.ReferenceBridge("ShowBertoReward");
return {
    Title = "Andre Berto", 
    Subtitle = "Former 2x Welterweight Champion (WBC & IBF)", 
    TalkSound = "Bringus", 
    GoodbyeCallback = function() --[[ Line: 11 ]]
        task.spawn(function() --[[ Line: 12 ]]
            game.Players.LocalPlayer.PlayerGui.BertoRewards.Close:Fire();
        end);
    end, 
    Dialog = {
        ["StartDaily#0"] = {
            Text = "What's happenin' champ? Listen, I got a whole\n<i>bunch of this stuff to give away...</i>", 
            GoTo = "StartFight1-2"
        }, 
        ["StartFight1-2"] = {
            Text = "And, I was thinking... <i>what if I had some fun with it?</i>", 
            Emote = "Shadowboxing", 
            Sound = 0, 
            GoTo = "StartFight1-3"
        }, 
        ["StartFight1-3"] = {
            Text = "<cb id=\"OpenRewards\" />So listen, the idea is, you <bb>fight me each day and if you win,\nI'll slide you some <rainbow><pop>nice rewards</pop></rainbow>.</bb> You in?", 
            Callbacks = {
                OpenRewards = function() --[[ Line: 33 ]] --[[ Name: OpenRewards ]]
                    -- upvalues: v2 (copy)
                    task.spawn(function() --[[ Line: 34 ]]
                        -- upvalues: v2 (ref)
                        v2:Fire();
                    end);
                end
            }, 
            Options = {
                {
                    Icon = "Question", 
                    Text = "I'm in!", 
                    Type = "ExtraDialog", 
                    GoTo = "StartFight1-4"
                }
            }
        }, 
        ["StartFight1-4"] = {
            Text = "<cb id=\"CloseRewards\" />That's what I'm talking about! I'll start easy on you.\nHow about we do some sparring?", 
            Emote = "Warmup", 
            Callbacks = {
                CloseRewards = function() --[[ Line: 55 ]] --[[ Name: CloseRewards ]]
                    task.spawn(function() --[[ Line: 56 ]]
                        game.Players.LocalPlayer.PlayerGui.BertoRewards.Close:Fire();
                    end);
                end
            }, 
            Options = {
                {
                    Icon = "Fight", 
                    Text = "Sounds good!", 
                    Type = "ExtraDialog", 
                    GoTo = "StartFight1-5"
                }
            }
        }, 
        ["StartFight1-5"] = {
            Text = "Let's see what you got!", 
            StartFight = "Fight1"
        }, 
        ["StartDaily#1"] = {
            Text = {
                "<cb id=\"OpenRewards\" />You ready for today's match, champ?"
            }, 
            Emote = "Warmup", 
            Callbacks = {
                OpenRewards = function() --[[ Line: 86 ]] --[[ Name: OpenRewards ]]
                    -- upvalues: v2 (copy)
                    task.spawn(function() --[[ Line: 87 ]]
                        -- upvalues: v2 (ref)
                        v2:Fire();
                    end);
                end
            }, 
            Options = {
                {
                    Icon = "Fight", 
                    Text = "Let's fight!", 
                    Type = "ExtraDialog", 
                    GoTo = "StartDailyFight"
                }, 
                {
                    Icon = "Question", 
                    Text = "Join my corner!", 
                    Type = "ExtraDialog", 
                    GoTo = "Gamepass"
                }
            }
        }, 
        StartDaily_Again = {
            Text = {
                "<cb id=\"OpenRewards\" />Ready to try again, champ?"
            }, 
            Emote = "Warmup", 
            Callbacks = {
                OpenRewards = function() --[[ Line: 120 ]] --[[ Name: OpenRewards ]]
                    -- upvalues: v2 (copy)
                    task.spawn(function() --[[ Line: 121 ]]
                        -- upvalues: v2 (ref)
                        v2:Fire();
                    end);
                end
            }, 
            Options = {
                {
                    Icon = "Fight", 
                    Text = "I'm ready!", 
                    Type = "ExtraDialog", 
                    GoTo = "StartDailyFight"
                }, 
                {
                    Icon = "Question", 
                    Text = "Join my corner!", 
                    Type = "ExtraDialog", 
                    GoTo = "Gamepass"
                }
            }
        }, 
        StartDailyFight = {
            Text = "That's what I'm talking about!", 
            AfterEmote = "DanteStyles", 
            StartFight = "Fight1"
        }, 
        StartDailyCooldown = {
            Text = "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" /><i>You can fight again in ", 
            AppendDailyCooldown = true, 
            Callbacks = {
                Notifications = function() --[[ Line: 191 ]] --[[ Name: Notifications ]]
                    task.spawn(function() --[[ Line: 192 ]]
                        local l_ExperienceNotificationService_0 = game:GetService("ExperienceNotificationService");
                        if l_ExperienceNotificationService_0:CanPromptOptInAsync() then
                            l_ExperienceNotificationService_0:PromptOptIn();
                        end;
                    end);
                end, 
                OpenRewards = function() --[[ Line: 199 ]] --[[ Name: OpenRewards ]]
                    -- upvalues: v2 (copy)
                    task.spawn(function() --[[ Line: 200 ]]
                        -- upvalues: v2 (ref)
                        v2:Fire();
                    end);
                end
            }, 
            Options = {
                {
                    Icon = "Question", 
                    Text = "Join my corner!", 
                    Type = "ExtraDialog", 
                    GoTo = "Gamepass"
                }
            }
        }, 
        Gamepass = {
            Text = "Very few can say they got <b>The Beast</b> in their corner...", 
            GoTo = "Gamepass2"
        }, 
        Gamepass2 = {
            Text = "UNLOCKS: Berto will join your corner and commentate your fight.\n[WARNING: Gamepass is discounted while more is being added to it!]", 
            Options = {
                {
                    Icon = "Question", 
                    Text = "Buy Gamepass", 
                    Type = "Gamepass", 
                    GamepassID = 1602385613
                }
            }
        }, 
        ["WonFight1#1"] = {
            Text = {
                "Not bad, kid! I think you're going to be a fun sparring partner."
            }, 
            GoTo = "WonFight1#1_FollowUp"
        }, 
        ["WonFight1#1_FollowUp"] = {
            Text = {
                "Next time, we're taking the gear off.\nI'll get a little bit more serious with you..."
            }, 
            GoTo = "WonFight1#1_FollowUp2"
        }, 
        ["WonFight1#1_FollowUp2"] = {
            Text = {
                "<cb id=\"OpenRewards\" />But in the meantime, enjoy your reward!"
            }, 
            Callbacks = {
                OpenRewards = function() --[[ Line: 258 ]] --[[ Name: OpenRewards ]]
                    -- upvalues: v2 (copy)
                    task.spawn(function() --[[ Line: 259 ]]
                        -- upvalues: v2 (ref)
                        v2:Fire();
                    end);
                end
            }, 
            GoTo = "WonFight1#1_FollowUp3"
        }, 
        ["WonFight1#1_FollowUp3"] = {
            Text = {
                "<cb id=\"Notifications\" />I need more practice. Come fight me every day for more rewards!\n<i>You can fight again in "
            }, 
            Callbacks = {
                Notifications = function() --[[ Line: 274 ]] --[[ Name: Notifications ]]
                    task.spawn(function() --[[ Line: 275 ]]
                        local l_ExperienceNotificationService_1 = game:GetService("ExperienceNotificationService");
                        if l_ExperienceNotificationService_1:CanPromptOptInAsync() then
                            l_ExperienceNotificationService_1:PromptOptIn();
                        end;
                    end);
                end
            }, 
            AppendDailyCooldown = true, 
            Options = {
                {
                    Icon = "Question", 
                    Text = "Join my corner!", 
                    Type = "ExtraDialog", 
                    GoTo = "Gamepass"
                }
            }
        }, 
        ["LostFight1#1"] = {
            Text = {
                "You gotta get serious if you want these rewards...\nOr is that all you got for me?"
            }, 
            GoTo = "StartDaily"
        }, 
        ["WonFight1#2"] = {
            Text = {
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That was a solid job, kid. You earned these rewards.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />Good fight. This reward\226\128\153s yours - you worked for it.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That performance earned you something extra today.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You handled that right. Take your rewards.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You stayed sharp and it paid off. Rewards are waiting.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That win wasn\226\128\153t luck. Enjoy what you earned.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You fought smart today. These rewards are yours.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You did the work. Go collect what\226\128\153s yours.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You\226\128\153re improving every fight, and today you get paid for it.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You earned this reward by staying disciplined.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That performance deserved a reward.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You\226\128\153re stacking wins, so you\226\128\153re stacking rewards.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You earned this one clean. The reward is all yours.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That was control and discipline - reward earned.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You\226\128\153re learning how to win the right way, and it pays off.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That performance unlocked your reward for today.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That\226\128\153s a win that comes with something extra.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You fought like a pro today. Take your rewards.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You handled business, so the rewards follow.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You stayed disciplined, and now you reap the benefits.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You earned this reward the right way.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That performance deserved more than just a win.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That was clean work. Your rewards are waiting.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You fought smart and earned something for it.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You made the right choices in there, and they paid off.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That performance earned you more than just respect.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You handled business and the rewards followed.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That win showed growth, so enjoy what comes with it.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You stayed focused all the way through. Reward earned.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You earned this reward by fighting smart.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />That win pushed you forward. Take what\226\128\153s yours.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />You earned this one the right way.", 
                "<cb id=\"OpenRewards\" /><cb id=\"Notifications\" />Keep fighting like that and the rewards won\226\128\153t stop."
            }, 
            Callbacks = {
                Notifications = function() --[[ Line: 340 ]] --[[ Name: Notifications ]]
                    task.spawn(function() --[[ Line: 341 ]]
                        local l_ExperienceNotificationService_2 = game:GetService("ExperienceNotificationService");
                        if l_ExperienceNotificationService_2:CanPromptOptInAsync() then
                            l_ExperienceNotificationService_2:PromptOptIn();
                        end;
                    end);
                end, 
                OpenRewards = function() --[[ Line: 348 ]] --[[ Name: OpenRewards ]]
                    -- upvalues: v2 (copy)
                    task.spawn(function() --[[ Line: 349 ]]
                        -- upvalues: v2 (ref)
                        v2:Fire();
                    end);
                end
            }
        }, 
        ["LostFight1#2"] = {
            Text = {
                "You had some good moments, but you hesitated when it counted.", 
                "I saw what you were trying to do, but it wasn\226\128\153t enough this time.", 
                "Don\226\128\153t sweat it, keep your head up. You\226\128\153ll learn from this one.", 
                "Close, but you left yourself open in the wrong spots.", 
                "You got some work to do if you want to beat me next time.", 
                "That fight didn\226\128\153t go your way, but it\226\128\153s part of the grind.", 
                "You hesitated there and it cost you the round.", 
                "You gave me some good shots, but you weren\226\128\153t consistent.", 
                "You\226\128\153re learning, but today wasn\226\128\153t your day in the ring.", 
                "I know you can do better, just need to focus more.", 
                "Keep at it, kid. Everyone hits setbacks, it\226\128\153s about how you respond.", 
                "Not bad, but you didn\226\128\153t capitalize on the openings I gave you.", 
                "You made a mistake there, and I took advantage of it.", 
                "I like the effort, but you weren\226\128\153t aggressive enough.", 
                "You\226\128\153ll get stronger from this fight if you stick to training.", 
                "That wasn\226\128\153t your fight, but that\226\128\153s okay - keep pushing.", 
                "You gotta be quicker to react if you want to win.", 
                "You held back too much instead of going for the finish.", 
                "You\226\128\153re getting there, but today you needed more control.", 
                "Don\226\128\153t let this one get to you - it\226\128\153s part of learning.", 
                "That was a rough one, but every loss teaches you something.", 
                "You\226\128\153ll figure it out - just stay hungry.", 
                "Keep practicing, kid. You\226\128\153re not at your limit yet.", 
                "Shake it off. A loss doesn\226\128\153t define you.", 
                "You\226\128\153re learning the hard way, but that\226\128\153s part of boxing.", 
                "That wasn\226\128\153t easy, but you\226\128\153ll grow from it.", 
                "Keep your guard up and your punches sharp next time.", 
                "Don\226\128\153t get discouraged, you\226\128\153re stronger than you think.", 
                "You got outpaced today, but you can change that.", 
                "You need sharper moves and faster reactions.", 
                "Losses happen to the best fighters \226\128\148 use it as fuel.", 
                "You didn\226\128\153t read my rhythm well enough this time.", 
                "Every round counts, and you let a few slip away.", 
                "You didn\226\128\153t push hard enough in the final moments.", 
                "You\226\128\153re building experience, and that\226\128\153s the real reward.", 
                "Take this one in stride. It\226\128\153s just another lesson."
            }
        }
    }
};