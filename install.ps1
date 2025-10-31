py -m venv venv
.\venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install --no-index --find-links=packages -r app/requirements.txt
Write-Host "Installation complete. Start with: .\start.ps1"
