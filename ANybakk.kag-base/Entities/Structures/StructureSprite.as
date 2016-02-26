/* 
 * Structure sprite.
 * 
 * Author: ANybakk
 */



namespace ANybakk {

  namespace StructureSprite {
  
  
  
    /**
     * Initialization event function
     */
    void onInit(CSprite@ this) {
      
      CBlob@ blob = this.getBlob();
    
      //Set default animation state (conveyor is not placed yet)
      this.SetAnimation("default");
      
      //Set default frame to 0
      this.animation.frame = 0;
      
      //Finished
      return;
      
    }



    /**
     * Tick event function
     */
    void onTick(CSprite@ this) {

      //Obtain a reference to the blob object
      CBlob@ blob = this.getBlob();
      
      //Check if tagged as recently placed
      if(blob.hasTag("wasPlaced")) {
      
        //Play a sound
        this.PlaySound(ANybakk::StructureVariables::PLACEMENT_SOUND);
        
        //Remove flag
        blob.Untag("wasPlaced");
        
      }
      
    }
    
    
    
    /**
     * Updates animation frame depending on current orientation. Useful in 
     * cases where standard rotation of sprite is not desired. Only affect 
     * placed blobs.
     * 
     * @param   variants    the number of variants supported (2 or 4)
     */
    void updateFrameFromOrientation(CSprite@ this, int variants=4) {
      
      //Obtain a reference to the blob object
      CBlob@ blob = this.getBlob();
      
      //Check if segment was recently placed
      if(blob.hasTag("wasPlaced")) {
      
        //Retrieve current orientation
        u16 orientation = blob.get_u16("StructureBlobOrientation");
        
        //Check if orientation is up
        if(orientation == ANybakk::StructureBlobOrientation::ORIENTATION_UP) {
        
          //Set frame to 0
          this.animation.frame = 0;
          
        }
        
        //Check if orientation is right
        else if(orientation == ANybakk::StructureBlobOrientation::ORIENTATION_RIGHT) {
        
          //Set frame to 1
          this.animation.frame = 1;
          
        }
        
        //Check if orientation is down
        else if(orientation == ANybakk::StructureBlobOrientation::ORIENTATION_DOWN) {
        
          if(variants == 2) {
          
            //Set frame to 0
            this.animation.frame = 0;
            
          } else {
          
            //Set frame to 0
            this.animation.frame = 2;
            
          }
          
        }
        
        //Check if orientation is left
        else if(orientation == ANybakk::StructureBlobOrientation::ORIENTATION_LEFT) {
        
          if(variants == 2) {
          
            //Set frame to 0
            this.animation.frame = 1;
            
          } else {
          
            //Set frame to 0
            this.animation.frame = 3;
            
          }
          
        }
        
        //Reset angle
        blob.getShape().SetAngleDegrees(0.0f);
        
      }
      
      //Finished
      return;
      
    }
    
    
    
  }
  
}