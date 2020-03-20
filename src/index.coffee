{ Client, MessageEmbed } = require 'discord.js'
config                   = require '../src/config/config.json'
client                   = new Client()

client.login(config.token)


client.on "ready", () -> console.log("Ready!")

voiceState = (oldMember, newMember) -> if newMember.member.voice
    try
       oldMember.member.user.send(new MessageEmbed().setAuthor(oldMember.member.voice.channel.name).setDescription("[Войти в комнату для трансляций](https://discordapp.com/channels/"+oldMember.guild.id+"/"+oldMember.id+")").setColor("#66CED1"))
    catch error


client.on 'voiceStateUpdate', voiceState