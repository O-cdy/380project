/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hkmu.comps380f.service;

import hkmu.comps380f.Exception.AttachmentNotFound;
import hkmu.comps380f.Exception.LectureNotFound;
import hkmu.comps380f.dao.AttachmentRepository;
import hkmu.comps380f.dao.LectureRepository;
import hkmu.comps380f.model.Attachment;
import hkmu.comps380f.model.Lecture;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class LectureService {

    @Resource
    private LectureRepository lectureRepo;
    @Resource
    private AttachmentRepository attachmentRepo;

    @Transactional
    public List<Lecture> getLectures() {
        return lectureRepo.findAll();
    }

    @Transactional
    public Lecture getLecture(long id) {
        return lectureRepo.findById(id).orElse(null);
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void delete(long id) throws LectureNotFound {
        Lecture deletedLecture = lectureRepo.findById(id).orElse(null);
        if (deletedLecture == null) {
            throw new LectureNotFound();
        }
        lectureRepo.delete(deletedLecture);
    }

    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long lectureId, String name) throws AttachmentNotFound {
        Lecture lecture = lectureRepo.findById(lectureId).orElse(null);
        for (Attachment attachment : lecture.getAttachments()) {
            if (attachment.getName().equals(name)) {
                lecture.deleteAttachment(attachment);
                lectureRepo.save(lecture);
                return;
            }
        }
        throw new AttachmentNotFound();
    }

    @Transactional
    public long createLecture(String lectureTitle, String lecturer,
            List<MultipartFile> lectureAttachments, List<MultipartFile> tutorialAttachments) throws IOException {
        Lecture lecture = new Lecture();
        lecture.setLectureTitle(lectureTitle);
        lecture.setLecturer(lecturer);
        for (MultipartFile filePart : lectureAttachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setFileType("lectureNotes");
            attachment.setLecture(lecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                lecture.getAttachments().add(attachment);
            }
        }
        for (MultipartFile filePart : tutorialAttachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setFileType("tutorialNotes");
            attachment.setLecture(lecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                lecture.getAttachments().add(attachment);
            }
        }
        Lecture savedLecture = lectureRepo.save(lecture);
        return savedLecture.getId();
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void updateLecture(long id, String lectureTitle,
            String lecturer, List<MultipartFile> lectureAttachments, List<MultipartFile> tutorialAttachments)
            throws IOException, LectureNotFound {
        Lecture updatedLecture = lectureRepo.findById(id).orElse(null);
        if (updatedLecture == null) {
            throw new LectureNotFound();
        }
        updatedLecture.setLectureTitle(lectureTitle);
        updatedLecture.setLecturer(lecturer);
        for (MultipartFile filePart : lectureAttachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setFileType("lectureNotes");
            attachment.setLecture(updatedLecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedLecture.getAttachments().add(attachment);
            }
        }
        for (MultipartFile filePart : tutorialAttachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setFileType("tutorialNotes");
            attachment.setLecture(updatedLecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedLecture.getAttachments().add(attachment);
            }
        }
        lectureRepo.save(updatedLecture);
    }
}
