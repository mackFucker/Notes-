from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton, KeyboardButton

#START
def start_markup():
    kb = InlineKeyboardMarkup()

    buttonSubscribe = InlineKeyboardButton(text="📣️  Для продолжения необходимо подписаться на наш канал 👇", callback_data="buttonSubscribe_id")
    buttonChanelLink = InlineKeyboardButton(text="📡 Наш канал", url="https://t.me/cipher_vpn")
    buttonISubscribed = InlineKeyboardButton(text="✅ Я подписался", callback_data="buttonSubscribe_id")

    kb.add(buttonSubscribe)
    kb.add(buttonChanelLink)
    kb.add(buttonISubscribed)

    return kb

#MAIN VPN MENU
def main_menu_markup():
    kb = InlineKeyboardMarkup()

    account = InlineKeyboardButton(text="⚙️ Аккаунт", callback_data="buttonSubscribe_id")
    help = InlineKeyboardButton(text="🆘 Помощь", callback_data="buttonSubscribe_id")
    VPN = InlineKeyboardButton(text="🛡 VPN", callback_data="buttonSubscribe_id")
    reviews = InlineKeyboardButton(text="📕 Отзывы", url="https://t.me/ciphervpnfeedback")

    activate_a_promo = InlineKeyboardButton(text = "💣 АКТИВИРОВАТЬ ПРОМОКОД", callback_data="buttonSubscribe_id")
    referral = InlineKeyboardButton(text="🤝  РЕФЕРАЛЬНАЯ СИСТЕМА ", callback_data="buttonSubscribe_id")

    kb.add(account)
    kb.insert(help)

    kb.add(VPN)
    kb.insert(reviews)

    kb.add(activate_a_promo)
    kb.add(referral)

    return kb

#ACCOUNT
def account_markup():
    kb = InlineKeyboardMarkup()

    balance = InlineKeyboardButton(text="💰 Пополнить баланс", callback_data="buttonSubscribe_id")
    vpn = InlineKeyboardButton(text="🛡 Мой VPN", callback_data="buttonSubscribe_id")
    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(balance).add(vpn).add(back)

    return kb

#REPLENISH_THE_BALANCE
def replenish_markup():
    kb = InlineKeyboardMarkup()

    replenish300 = InlineKeyboardButton(text="300₽", callback_data="buttonSubscribe_id")
    replenish600 = InlineKeyboardButton(text="600₽", callback_data="buttonSubscribe_id")
    replenish900 = InlineKeyboardButton(text="900₽", callback_data="buttonSubscribe_id")
    replenish1200 = InlineKeyboardButton(text="1200₽", callback_data="buttonSubscribe_id")
    own_amount = InlineKeyboardButton(text="Своя сумма", callback_data="buttonSubscribe_id")

    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(replenish300).insert(replenish600).add(replenish900).insert(replenish1200)
    kb.add(own_amount)
    kb.add(back)

    return kb

#OWN_AMOUT
def replenish_markup():
    kb = InlineKeyboardMarkup()

    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(back)

    return kb

#HELP
def help_markup():
    kb = InlineKeyboardMarkup()

    chanel = InlineKeyboardButton(text="📣 Канал", url="https://t.me/cipher_vpn")
    instructions = InlineKeyboardButton(text="📄 Инструкции", callback_data="buttonSubscribe_id")
    support = InlineKeyboardButton(text="💬 Связаться с поддержкой", url="https://t.me/cipher_vpn_help")
    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(chanel).add(instructions).add(support).add(back)

    return kb

#INSTRUCTIONS
def instructions_markup():
    kb = InlineKeyboardMarkup()

    android = InlineKeyboardButton(text="🤖 Androind", callback_data="buttonSubscribe_id")
    iphone = InlineKeyboardButton(text="🍎 iPhone / iPad", callback_data="buttonSubscribe_id")
    windows = InlineKeyboardButton(text="🖥 Windows", callback_data="buttonSubscribe_id")
    mac = InlineKeyboardButton(text="💻 Mac", callback_data="buttonSubscribe_id")
    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")


    kb.add(android).insert(iphone).add(windows).insert(mac).add(back)

    return kb

#INSTRUCTIONS_IN_DETAIL
def instruction_in_detail():
    kb = InlineKeyboardMarkup()

    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(back)

#VPN
def VPN_markup():
    kb = InlineKeyboardMarkup()

    country = InlineKeyboardButton(text="🇳🇱 Нидерланды", callback_data="buttonSubscribe_id")
    vpn = InlineKeyboardButton(text="🛡 Мой VPN", callback_data="buttonSubscribe_id")
    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(country).add(vpn).add(back)

    return kb

#VPN_PRICE
def vpn_price():
    kb = InlineKeyboardMarkup()

    month = InlineKeyboardButton(text="Месяц, 100₽", callback_data="buttonSubscribe_id")
    six_month = InlineKeyboardButton(text="Пол года, 540 (-10%)₽", callback_data="buttonSubscribe_id")
    year = InlineKeyboardButton(text="Год, 960 (-20%)₽", callback_data="buttonSubscribe_id")
    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

    kb.add(month).add(six_month).add(year).add(back)
    return kb

#ACTIVATE_A_PROMO
def activate_a_promom_markup():
    kb_inLine = InlineKeyboardMarkup()


    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")
    # main_menu = KeyboardButton('🔄 главное меню')

    kb_inLine.add(back)

    return kb_inLine

#ACTIVATED_OR_NOT
def activate_or_not_markup():
    kb_inLine = InlineKeyboardMarkup()

    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")
    vpn = InlineKeyboardButton(text="🛡 Мой VPN", callback_data="buttonSubscribe_id")

    # main_menu = KeyboardButton('🔄 главное меню')
    kb_inLine.add(vpn).add(back)

    return kb_inLine

#REFERRAL
def refferal_markup():
    kb = InlineKeyboardMarkup()

    link = InlineKeyboardButton(text="💰 Поделится ссылкой", callback_data="buttonSubscribe_id")
    withdrawal_of_funds = InlineKeyboardButton(text="💳 Вывод средств", callback_data="buttonSubscribe_id")
    back = InlineKeyboardButton(text="🔙 Назад", callback_data="buttonSubscribe_id")

