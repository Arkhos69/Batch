# Batch

### Decimal to Binary

[decimal_to_binary.bat](https://github.com/Arkhos69/Batch/blob/main/decimal_to_binary.bat)

![dectobin](https://user-images.githubusercontent.com/98234168/150714928-009760e0-655f-4f82-88a0-516098caf92e.png)

### Decimal to Hex

[decimal_to_hex.bat](https://github.com/Arkhos69/Batch/blob/main/decimal_to_hex.bat)

![dectohex](https://user-images.githubusercontent.com/98234168/151214390-96811e73-14e3-4dc3-a0b8-7bf7835a2c49.png)

### Read batch label

[read_batch_label.bat](https://github.com/Arkhos69/Batch/blob/main/read_batch_label.bat)

![read_label](https://user-images.githubusercontent.com/98234168/152821608-6ce30e19-4fe8-4810-9ef2-3411a8e6895f.png)

![read_label2](https://user-images.githubusercontent.com/98234168/152826325-051d7c7b-6752-4bd8-b80c-dc4661023b02.png)

### String to Ascii

[string_to_ascii.bat](https://github.com/Arkhos69/Batch/blob/main/string_to_ascii.bat)

![string_to_ascii](https://user-images.githubusercontent.com/98234168/151112852-317b7a54-9720-4c58-8289-eb88fc0180a0.png)

### String Keyword split

[string_keyword_split.bat](https://github.com/Arkhos69/Batch/blob/main/string_keyword_split.bat)

![cut](https://user-images.githubusercontent.com/98234168/159183794-8453359d-672e-4c9e-981c-d962b113befe.png)

```
@echo off

set "delims=cut"
set "string=123cut456cut789"
call :loop
pause

:loop
set /a cnt+=1 &set "a=" 
for /f "tokens=%cnt% delims=%delims%" %%a in ("%string%") do set "a=%%a" &echo %%a
if not defined a exit /b
goto loop
```
:(
