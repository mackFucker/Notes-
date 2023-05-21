
from aiogram.dispatcher.filters import Command
from aiogram import types

from loader import dp

@dp.message_handler(Command('menu'))
async def menu(message: types.Message):
    await message.answer("йй")

    # - создание менюшек