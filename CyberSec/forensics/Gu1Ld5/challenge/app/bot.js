const { Client, GatewayIntentBits } = require("discord.js");

const client = new Client({
  intents: [GatewayIntentBits.Guilds],
});

const TOKEN =
  "MTA0NjgzMDEzODM4NzYwNzY4Mg.GJ9ajz.kiJiLMR9hTHeT-LV6_pi-zvjZbttdaKcOKoteE";

client.once("ready", () => {
  console.log("Connected");
});

client.login(TOKEN);
