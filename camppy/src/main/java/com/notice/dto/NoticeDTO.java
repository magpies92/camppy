package com.notice.dto;

import java.sql.Timestamp;

public class NoticeDTO {

		private int notice_id; //게시글아이디
		private Timestamp create_date; //작성날짜
		private Timestamp last_modified_date; //수정날짜
		private String created_by; //생성자
		private String last_modified_by; //마지막 수정자
		private String content; //댓글
		private int post_type; //게시글 종류
		private String title; //제목
		private int member_id; //회원 아이디
		private int notice_cnt; //조회수
		
		
		public int getNotice_id() {
			return notice_id;
		}
		public void setNotice_id(int notice_id) {
			this.notice_id = notice_id;
		}

		public String getCreated_by() {
			return created_by;
		}
		public void setCreated_by(String created_by) {
			this.created_by = created_by;
		}
		public String getLast_modified_by() {
			return last_modified_by;
		}
		public void setLast_modified_by(String last_modified_by) {
			this.last_modified_by = last_modified_by;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getPost_type() {
			return post_type;
		}
		public void setPost_type(int post_type) {
			this.post_type = post_type;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public int getMember_id() {
			return member_id;
		}
		public void setMember_id(int member_id) {
			this.member_id = member_id;
		}
		public int getNotice_cnt() {
			return notice_cnt;
		}
		public void setNotice_cnt(int notice_cnt) {
			this.notice_cnt = notice_cnt;
		}
		public Timestamp getCreate_date() {
			return create_date;
		}
		public void setCreate_date(Timestamp create_date) {
			this.create_date = create_date;
		}
		public Timestamp getLast_modified_date() {
			return last_modified_date;
		}
		public void setLast_modified_date(Timestamp last_modified_date) {
			this.last_modified_date = last_modified_date;
		}

		
		
}
