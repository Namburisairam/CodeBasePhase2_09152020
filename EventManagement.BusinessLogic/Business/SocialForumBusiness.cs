using EventManagement.BusinessLogic.BussinessBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using EventManagement.DataAccess.DataBase.Model;
using System.IO;
using EventManagement.BusinessLogic.Models;

namespace EventManagement.BusinessLogic.Business
{
    public class SocialForumLogic : BaseLogic
    {
        public object SaveText(SocialPostMdoel post)
        {
            if (Db.PostTypes.Any(x => x.Name == "Text"))
            {

                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    PostTypeid = Db.PostTypes.FirstOrDefault(x => x.Name == "Text").ID,
                    Status = false,
                    DeleteRequest = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            else
            {
                var type = new DataAccess.DataBase.Model.PostType
                {
                    Name = "Text"
                };
                Db.PostTypes.Add(type);
                Db.SaveChanges();
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    PostTypeid = type.ID,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    Status = false,
                    DeleteRequest = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            return null;
        }
        public object SavePhoto(SocialPostMdoel post)
        {
            if (Db.PostTypes.Any(x => x.Name == "Photo"))
            {
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    URL = post.Photo,
                    PostTypeid = Db.PostTypes.FirstOrDefault(x => x.Name == "Photo").ID,
                    Status = false,
                    DeleteRequest = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            else
            {
                var type = new DataAccess.DataBase.Model.PostType
                {
                    Name = "Photo"
                };
                Db.PostTypes.Add(type);
                Db.SaveChanges();
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    PostTypeid = type.ID,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    URL = post.Photo,
                    Status = false,
                    DeleteRequest = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            return null;
        }
        public object SaveVideo(SocialPostMdoel post)
        {
            if (Db.PostTypes.Any(x => x.Name == "Video"))
            {
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    UploadBY = post.AttendeeId,
                    URL = post.Video,
                    PostTypeid = Db.PostTypes.FirstOrDefault(x => x.Name == "Video").ID,
                    Status = false,
                    DeleteRequest = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            else
            {
                var type = new DataAccess.DataBase.Model.PostType
                {
                    Name = "Video"
                };
                Db.PostTypes.Add(type);
                Db.SaveChanges();
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    SocialForumDescription = post.Text,
                    UploadBY = post.AttendeeId,
                    PostTypeid = type.ID,
                    URL = post.Video,
                    Status = false,
                    DeleteRequest = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            return null;
        }
        public async Task<IEnumerable<SocialForum>> GetEventPosts(int eventId, string value = "")
        {
            if (Db.Events.Any(x => x.ID == eventId && x.ModeratePost == true))
            {
                if (string.IsNullOrEmpty(value))
                    return await Db.SocialForums.Where(x => x.EventID == eventId && x.Status == true && x.isDeleted == false).ToListAsync();
                else return await Db.SocialForums.Where(x => x.EventID == eventId && x.Status == true && x.isDeleted == false && (x.Attende.FirstName.StartsWith(value)
                || x.SocialForumDescription.Contains(value) || x.Event.EventName.StartsWith(value) || x.ForumSocialComments.Any(y => y.Comment.Contains(value)))).ToListAsync();
            }
            if (string.IsNullOrEmpty(value))
                return await Db.SocialForums.Where(x => x.EventID == eventId && x.isDeleted == false).ToListAsync();
            else return await Db.SocialForums.Where(x => x.EventID == eventId && x.isDeleted == false && (x.Attende.FirstName.StartsWith(value)
            || x.SocialForumDescription.Contains(value) || x.Event.EventName.StartsWith(value) || x.ForumSocialComments.Any(y => y.Comment.Contains(value)))).ToListAsync();
        } 
        public bool PostVideo(byte[] bytes, string name)
        {
            MemoryStream ms = new MemoryStream(bytes);
            FileStream outStream = System.IO.File.OpenWrite(name);
            ms.WriteTo(outStream);
            outStream.Flush();
            outStream.Close();
            return true;

        }
        public object SaveLink(SocialPostMdoel post)
        {
            if (Db.PostTypes.Any(x => x.Name == "Link"))
            {
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    PostTypeid = Db.PostTypes.FirstOrDefault(x => x.Name == "Link").ID,
                    Status = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            else
            {
                var type = new DataAccess.DataBase.Model.PostType
                {
                    Name = "Link"
                };
                Db.PostTypes.Add(type);
                Db.SaveChanges();
                Db.SocialForums.Add(new DataAccess.DataBase.Model.SocialForum
                {
                    SocialForumDescription = post.Text,
                    PostTypeid = type.ID,
                    EventID = post.EventId,
                    AttendesID = post.AttendeeId,
                    URL = post.Photo,
                    Status = false,
                    UploadON = DateTime.Now
                });
                Db.SaveChanges();
            }
            return null;
        }
        public async Task<IEnumerable<Notification>> GetAllNotifications()
        {
          // var RECORD = Db.Notifications.Find()
          return await  Db.Notifications.ToListAsync();
          
        

        }
        /// <summary>
        /// Social Post Likes
        /// </summary>
        /// <param name="userid"></param>
        /// <param name="postid"></param>
        /// <returns></returns>
        public async Task<(bool isLiked, string likes) > LikePost(int userid,int postid)
        {

            try
            {
                var checklike = Db.PostUserLikes.Where(x => x.AttendesID == userid && x.PostID == postid).FirstOrDefault();
                if (checklike == null)
                {
                    Db.PostUserLikes.Add(new PostUserLike { AttendesID = userid, PostID = postid });
                   await Db.SaveChangesAsync();
                }
                else
                {
                    Db.PostUserLikes.Remove(checklike);
                    await Db.SaveChangesAsync();
                }
                var count = Db.PostUserLikes.Where(x => x.PostID == postid).Count();
                return (checklike == null,  count <= 2 ? String.Join(",", Db.PostUserLikes.Where(x => x.PostID == postid).Select(y => y.Attende.FirstName)) : count.ToString());
            }
            catch (Exception ex)
            {

                throw ex;
            }
           
        }
        //public async Task<IEnumerable<SocialCommentDTO>> GetComments(int userid, int postid)
        //{

        //    try
        //    {
        //        var data = await Db.ForumSocialComments.Where(x => x.AttendesID == userid && x.PostID == postid).ToListAsync();

        //        return data.Select(x => new SocialCommentDTO
        //        {
        //            ID = x.ID,
        //            PostID = x.PostID,
        //            AttendesID = x.AttendesID,
        //            Comments = x.Comments,
        //            ApprovedON = x.ApprovedON,
        //            ApprovedBY = x.ApprovedBY,
        //            CommentedON = x.CommentedON,
        //            ReplyerID = x.ReplyerID
        //        });


        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }

        //}
        /// <summary>
        /// Social Post
        /// </summary>
        /// <param name="user"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<ForumSocialComment> GetComments(int user , int? id)
        {
            return  Db.ForumSocialComments.Where(x => x.PostID == id).ToList();
        }

        public List<PostUserLike> GetLikes( int? id)
        {
            return Db.PostUserLikes.Where(x => x.PostID == id).ToList();
        }

        public bool PostComment(int userid, int postid, string comment)
        {
            try
            {
                ForumSocialComment sc = new ForumSocialComment();
                sc.PostID = postid;
                sc.Comment = comment;
                sc.AttendesID = userid;
                sc.CommentedON = DateTime.Now;
                Db.ForumSocialComments.Add(sc);
                Db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
           
        }
        public bool PostLinks(int userid, string fb, string twitter, string insta, string linkedin)
        {
            try
            {
                var profile = Db.Attendes.Find(userid);

                profile.FacebookURL = fb;
                profile.InstagramURL = insta;
                profile.LinkedinURL = linkedin;
                profile.TwitterURL = twitter;
                Db.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                throw;
            }

        }

        public List<Photo> GetAlbumPhotos(int albumID) {
            return Db.PhotoAlbums.Find(albumID)?.Photos.Where( x=> (!x.Event.ModeratePost || x.Status) && x.isDeleted == false).ToList();
        }

        public List<PhotoAlbum> GetEventAlbums(int eventID) {
            return Db.Events.Find(eventID)?.PhotoAlbums.ToList();
        }

        public int CommentsCount(int Postid)
        {
            return Db.ForumSocialComments.Where(x => x.PostID == Postid).Count();
        }

        public (int likeCount,  bool isLiked ) HandlePhotoLike(int photoID, int attendeeID, bool isLike)
        {
            var photoLikeEntity = Db.PhotoLikes.FirstOrDefault(x => x.AttendeeID == attendeeID && x.PhotoID == photoID);
            if (photoLikeEntity == null)
            {
                if (isLike)
                {
                    Db.PhotoLikes.Add(new PhotoLike()
                    {
                        AttendeeID = attendeeID,
                        PhotoID = photoID
                    });
                }
                else
                {
                    throw new Exception("Photo is not liked yet");
                }
            }
            else
            {
                if (!isLike)
                {
                    Db.PhotoLikes.Remove(photoLikeEntity);
                }
                else
                {
                    throw new Exception("Photo is already liked");
                }
            }
            Db.SaveChanges();
            return (Db.PhotoLikes.Where(x=> x.PhotoID == photoID).Count(), isLike);
        }

        public List<Attende> GetPhotoLikedAttendees(int photoID, int eventId)
        {
            var res = from ps in Db.Photos.Where(s => s.ID == photoID && s.EventID == eventId)
                                            join pl in Db.PhotoLikes.Where(x => x.PhotoID == photoID)
                                            on ps.ID equals pl.PhotoID
                                            select new { pl.Attende };

            return  res.Select(s=>s.Attende).ToList();
            
        }

    }
    public class SocialPostMdoel
    {
        public int EventId { get; set; }
        public int AttendeeId { get; set; }
        public string Link { get; set; }
        public string Text { get; set; }
        public string Photo { get; set; }
        public string Video { get; set; }
    }
}
