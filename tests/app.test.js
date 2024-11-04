const request = require('supertest');
const app = require('../app'); // Make sure this points to your app file

describe('GET /', () => {
  it('should return status code 200 and contain teammates list', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.text).toContain('Hello, Teammates!');
    expect(response.text).toContain('mohamed abdelfattah maghawry mostafa');
    expect(response.text).toContain('Mahmoud Mohamed Ali Shokry');
  });
});
