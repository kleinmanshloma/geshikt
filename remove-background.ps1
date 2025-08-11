# PowerShell script to remove white background from logo
Add-Type -AssemblyName System.Drawing

# Load the image
$imagePath = "C:\Users\shlom\Desktop\geshikkt\geshikt-logo.png"
$outputPath = "C:\Users\shlom\Desktop\geshikkt\geshikt-logo-transparent.png"

try {
    # Load the original image
    $originalImage = [System.Drawing.Image]::FromFile($imagePath)
    
    # Create a new bitmap with the same dimensions
    $bitmap = New-Object System.Drawing.Bitmap $originalImage.Width, $originalImage.Height
    
    # Create graphics object
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    
    # Fill with transparent background
    $graphics.Clear([System.Drawing.Color]::Transparent)
    
    # Draw the original image
    $graphics.DrawImage($originalImage, 0, 0)
    
    # Make white pixels transparent
    $bitmap.MakeTransparent([System.Drawing.Color]::White)
    
    # Save as PNG with transparency
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    Write-Host "Background removed successfully! Saved as: $outputPath"
    
    # Clean up
    $graphics.Dispose()
    $bitmap.Dispose()
    $originalImage.Dispose()
    
} catch {
    Write-Host "Error processing image: $_"
}
