# Import All Files
cd # Go to Home Directory

git clone https://github.com/AnkanSaha/Video-Downloader.git # Clone the Repository

cd Video-Downloader # Go to the Repository

# Install All Dependencies
npm install

# Install Environment Variables
read -p "Enter the LIVE URL: " LIVE_URL # Get the LIVE URL
read -p "Enter PORT Number: " PORT # Get the PORT Number
read -p "Enter RAPID API KEY: " RAPID_API_KEY # Get the RAPID API KEY
read -p "Enter YT MUSIC HOST: " YT_MUSIC_HOST # Get the YT MUSIC HOST
read -p "Enter YT MUSIC URL: " YT_MUSIC_URL # Get the YT MUSIC URL
read -p "Enter YT VIDEO HOST: " YT_VIDEO_HOST # Get the YT VIDEO HOST
read -p "Enter YT VIDEO URL: " YT_VIDEO_URL # Get the YT VIDEO URL

# Create .env File
touch .env # Create .env File
echo "CORSALLOWEDURL=$LIVE_URL" >> .env # Add LIVE_URL to .env File
echo "PORT=$PORT" >> .env # Add PORT to .env File
echo "RAPIDAPIKEY=$RAPID_API_KEY" >> .env # Add RAPID_API_KEY to .env File
echo "YTMUSICHOST=$YT_MUSIC_HOST" >> .env # Add YT_MUSIC_HOST to .env File
echo "YTMUSICURL=$YT_MUSIC_URL" >> .env # Add YT_MUSIC_URL to .env File
echo "YTVIDEOHOST=$YT_VIDEO_HOST" >> .env # Add YT_MUSIC_URL to .env File
echo "YTVIDEOURL=$YT_VIDEO_URL" >> .env # Add YT_MUSIC_URL to .env File

# Start the Server
npm start # Start the Server