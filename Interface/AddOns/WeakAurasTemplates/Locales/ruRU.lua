if not(GetLocale() == "ruRU") then
  return
end

local L = WeakAuras.L

-- WeakAuras/Templates
	L[" (Channeling)"] = "(восстановление здоровья)"
	L[" (Healing received increase)"] = "(увеличено входящее исцеление)"
	L["- Any"] = "- Любой"
	L["- Death Knight 2P Bonus"] = "- Бонус от 2-х частей комплекта, Рыцарь смерти"
	L["- Death Knight T20 Blood 2P Bonus"] = "- Бонус от 2-х частей комплекта T20, Рыцарь смерти (Кровь)"
	L["- Death Knight Unholy 4P Bonus"] = "- Бонус от 4-х частей комплекта, Рыцарь смерти (Нечестивость)"
	L["- Deathknight 2P Bonus"] = " - Бонус от 2-х частей комплекта, Рыцарь смерти"
	L["- Deathknight Unholy 4P Bonus"] = "- Бонус от 4-х частей комплекта, Рыцарь смерти (Нечестивость)"
	L["- Holy Word: Chastise"] = " - Слово Света: Наказание"
	L["- Holy Word: Sanctify"] = "- Слово Света: Освящение"
	L["- Holy Word: Serenity"] = "- Слово Света: Безмятежность"
	L["- Hunter T20 Marksman 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Охотник (Стрельба)"
	L["- Mage T20 Arcane 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Маг (Тайная магия)"
	L["- Mage T20 Fire 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Маг (Огонь)"
	L["- Mage T20 Frost 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Маг (Лед)"
	L["- Monk T20 Mistweaver 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Монах (Ткач туманов)"
	L["- Monk Windwalker 4P Bonus"] = " - Бонус от 4-х частей комплекта, Монах (Танцующий с ветром)"
	L["- Paladin Protection 2P Bonus"] = " - Бонус от 2-х частей комплекта, Паладин (Защита)"
	L["- Paladin Retribution 2P Bonus"] = " - Бонус от 2-х частей комплекта, Паладин (Воздаяние)"
	L["- Paladin T19 Retribution 4P Bonus"] = " - Бонус от 4-х частей комплекта Т19, Паладин (Воздаяние)"
	L["- Paladin T20 Holy 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Паладин (Свет)"
	L["- Paladin T20 Protection 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Паладин (Защита)"
	L["- Paladin T20 Retribution 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Паладин (Воздаяние)"
	L["- Priest T20 Discipline 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Жрец (Послушание)"
	L["- Priest T20 Shadow 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Жрец (Тьма)"
	L["- Rogue Assassination/Outlaw 4P Bonus"] = " - Бонус от 4-х частей комплекта, Разбойник (Ликвидация / Головорез)"
	L["- Rogue Subtlety 4P Bonus"] = " - Бонус от 4-х частей комплекта, Разбойник (Скрытность)"
	L["- Rogue T19 Outlaw 4P Bonus"] = " - Бонус от 4-х частей комплекта Т19, Разбойник (Головорез)"
	L["- Shaman Elemental 4P Bonus"] = " - Бонус от 4-х частей комплекта, Шаман (Стихии)"
	L["- Shaman Enhancement 2P Bonus"] = " - Бонус от 2-х частей комплекта, Шаман (Совершенствование)"
	L["- Shaman T20 Elemental 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Шаман (Стихии)"
	L["- Shaman T20 Enhancement 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Шаман (Совершенствование)"
	L["- Shaman T20 Enhancement 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Шаман (Совершенствование)"
	L["- Shaman T20 Restoration 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Шаман (Исцеление)"
	L["- Shaman T20 Restoration 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Шаман (Исцеление)"
	L["- T19 Druid Guardian 4P Bonus"] = " - Бонус от 4-х частей комплекта Т19, Друид (Страж)"
	L["- Warlock Affliction 4P/Demonology 2P Bonus"] = " - Бонус от 4-х (Колдовство) / 2-x (Демонология) частей комплекта, Чернокнижник"
	L["- Warlock T19 Destruction 4P Bonus"] = "- Бонус от 4-х частей комплекта Т19, Чернокнижник (Разрушение)"
	L["- Warlock T20 Affliction 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Чернокнижник (Колдовство)"
	L["- Warlock T20 Demonology 4P Bonus"] = "- Бонус от 4-х частей комплекта Т20, Чернокнижник (Демонология)"
	L["- Warrior 2P Bonus"] = "- Бонус от 2-х частей комплекта, Воин"
	L["- Warrior T19 Fury 2P Bonus"] = "- Бонус от 2-х частей комплекта Т19, Воин (Неистовство)"
	L["- Warrior T20 Fury 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Воин (Неистовство)"
	L["- Warrior T20 Protection 2P Bonus"] = "- Бонус от 2-х частей комплекта Т20, Воин (Защита)"
	L["(Pet)"] = "(питомец)"
	L["(Water Elemental)"] = "(элементаль воды)"
	L["Ability Charges"] = "Заряды способности"
	L["Add Triggers"] = "Добавить триггеры"
	L["Always Active"] = "Всегда активный триггер"
	L["Back"] = "Назад"
	L["Bleed"] = "(кровотечение)"
	L["BloodLust/Heroism"] = "Жажда крови / Героизм"
	L["Bloodlust/Heroism"] = "Жажда крови / Героизм"
	L["buff"] = "(бафф)"
	L["Buff"] = "(бафф)"
	L["Buffs"] = "Баффы"
	L["Cancel"] = "Отмена"
	L["Cast"] = "Применение заклинания (каст)"
	L["Concordance of the Legionfall"] = "Согласованность Армии погибели Легиона"
	L["cooldown"] = "(восстановление)"
	L["Cooldowns"] = "Восстановление (перезарядка)"
	L["Crimson Vial Item Count"] = "Подсчитать использование предмета \"Алый фиал\""
	L["Damage Trinkets"] = "Аксессуары бойца"
	L["debuff"] = "(дебафф)"
	L["Debuffs"] = "Дебаффы"
	L["Enchants"] = "Чары"
	L["General"] = "Общие"
	L["Healer Trinkets"] = "Аксессуары лекаря"
	L["Health"] = "Здоровье"
	L["Keeps existing triggers intact"] = "Сохранить существующие триггеры нетронутыми"
	L["Legendaries"] = "Легендарные предметы"
	L["Legion Sets"] = "Комплекты Легиона"
	L["Nimble Brew Item Count"] = "Подсчитать использование предмета \"Отвар проворства\""
	L["Pet alive"] = "Питомец жив"
	L["Pet Behavior"] = "Поведение питомца"
	L["PVP Set"] = "Комплект PvP"
	L["PvP Talents"] = "Таланты PvP"
	L["PVP Trinkets"] = "Аксессуары PvP"
	L["Replace all existing triggers"] = "Заменить все существующие триггеры"
	L["Replace Triggers"] = "Заменить триггеры"
	L["Resources"] = "Ресурсы"
	L["Resources and Shapeshift Form"] = "Форма Друида и ресурсы"
	L["Rooted"] = "(обездвиживание)"
	L["Runes"] = "Руны"
	L["Shapeshift Form"] = "Форма Друида"
	L["Slowed"] = "(замедление)"
	L["Stagger"] = "Пошатывание"
	L["Stun"] = "(оглушение)"
	L["T19 Damage Trinkets"] = "Аксессуары Т19, роль \"Боец\" "
	L["T19 Healer Trinkets"] = "Аксессуары Т19, роль \"Лекарь\" "
	L["T19 Sets"] = "Комплекты Т19"
	L["T19 Tank Trinkets"] = "Аксессуары Т19, роль \"Танк\" "
	L["Tank Trinkets"] = "Аксессуары танка"
	L["Totem"] = "Тотем"
	L["Totems"] = "Тотемы"
	L["Unknown Item"] = "Неизвестный предмет"
	L["Unknown Spell"] = "Неизвестное заклинание"

