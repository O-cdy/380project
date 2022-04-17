package hkmu.comps380f.service;

import hkmu.comps380f.dao.AttachmentRepository;
import hkmu.comps380f.model.Attachment;
import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
public class AttachmentService {

    @Resource
    private AttachmentRepository attachmentRepo;

    @Transactional
    public Attachment getAttachment(long lectureId, String name) {
        return attachmentRepo.findByLectureIdAndName(lectureId, name);
    }
}
