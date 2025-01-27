import { createRammerhead } from 'rammerhead/src/server/index.js';

export default async function handler(req, res) {
  const proxyServer = createRammerhead();

  // Emit the request to the proxy server
  proxyServer.emit('request', req, res);

  // Handle WebSocket upgrades
  proxyServer.on('upgrade', (req, socket, head) => {
    proxyServer.emit('upgrade', req, socket, head);
  });
}
