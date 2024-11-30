import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { getMethod ,postMethodPayload, deleteMethod} from '../../services/request';
import Swal from 'sweetalert2';


const AdminChatLieu = ()=>{
    const [items, setItems] = useState([]);
    const [item, setItem] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(()=>{
        getData();
    }, []);

    async function saveData(event) {
        event.preventDefault();
        const catename = event.target.elements.catename.value;
        const status = parseInt(event.target.elements.status.value);
        // Kiểm tra tên chất liệu
        if (!catename.trim()) {
            toast.error("Tên chất liệu không được để trống.");
            return;
        }
        if (catename.length > 255) {
            toast.error("Tên chất liệu không được quá 255 ký tự.");
            return;
        }

        var user = JSON.parse(localStorage.getItem("user"));
        const payload = {
            tenChatLieu: catename,
            nguoiTao: user.maNhanVien,
            nguoiCapNhat: user.maNhanVien,
            trangThai: status,
        };
        if (item != null) {
            payload.nguoiTao = item.nguoiTao;
        }

        var url = '/api/chat-lieu';
        if (item != null) {
            url += '/' + item.id;
        }

        const res = await postMethodPayload(url, payload);
        if (res.status < 300) {
            toast.success('Success!');
            await new Promise(resolve => setTimeout(resolve, 1000));
            window.location.reload();
        }
        if (res.status === 417) {
            var result = await res.json();
            toast.error(result.defaultMessage);
        }
        if (res.status > 300) {
            var result = await res.json();
            toast.error(result.message);
        }
    };



    async function getData() {
        const response = await getMethod('/api/chat-lieu');
        let result = await response.json();
        if (searchTerm.trim() !== '') {
            result = result.filter(item =>
                item.tenChatLieu.toLowerCase().includes(searchTerm.toLowerCase())
            );
        }
        setItems(result);
    }


    async function deleteData(id){
        Swal.fire({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa mục này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
            reverseButtons: true,
        }).then(async (result) => {
            if (result.isConfirmed) {
                const response = await deleteMethod('/api/chat-lieu/' + id);
                if (response.status < 300) {
                    toast.success("Xóa thành công!");
                    getData();
                } else if (response.status === 417) {
                    const result = await response.json();
                    toast.warning(result.defaultMessage);
                } else {
                    toast.warning("Xóa thất bại");
                }
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                console.log("Hủy thao tác xóa.");
            }
        });
    }
    function handleShowAllClick() {
        setSearchTerm(''); // Đặt lại từ khóa tìm kiếm
        getData(); // Lấy lại toàn bộ dữ liệu
    }
    function handleSearchClick() {
        if (searchTerm.trim() === '') {
            toast.warning("Vui lòng nhập từ khóa để tìm kiếm."); // Hiển thị thông báo nếu không có từ khóa
        } else {
            getData(searchTerm); // Gọi API với từ khóa tìm kiếm
        }
    }

    function clearInput(){
        setItem(null);
    }

    return (
        <>
            <div class="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong class="text-left"><i className='fa fa-list'></i> Quản lý chất liệu</strong>
                <div className="search-wrapper d-flex align-items-center justify-content-between">
                    <div className="search-container d-flex align-items-center bg-light p-2 rounded shadow-sm">
                        <input
                            type="text"
                            placeholder="Tìm kiếm theo tên"
                            className="form-control border-0 shadow-none"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            style={{flex: 1}}
                        />
                        <button className="btn btn-primary ms-2" onClick={handleSearchClick}>
                            <i className="fa fa-search"></i> Tìm kiếm
                        </button>
                        <button className="btn btn-secondary ms-2" onClick={handleShowAllClick}>
                            <i className="fa fa-list"></i> Tất cả
                        </button>
                    </div>
                    <button onClick={() => clearInput()} data-bs-toggle="modal" data-bs-target="#addcate"
                            className="btn btn-success ms-3">
                        <i className='fa fa-plus'></i> Thêm mới
                    </button>
                </div>
            </div>
            <div class="tablediv">
                <div class="headertable">
                    <span class="lbtable">Danh sách chất liệu</span>
                </div>
                <div class="divcontenttable">
                    <table id="example" class="table table-bordered">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>Tên chất liệu</th>
                            <th>Người tạo</th>
                            <th>Người cập nhật</th>
                            <th>Trạng thái</th>
                            <th class="sticky-col">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        {items.map((item => {
                            return <tr>
                                <td>{item.id}</td>
                                <td>{item.tenChatLieu}</td>
                                <td>{item.nguoiTao}</td>
                                <td>{item.nguoiCapNhat}</td>
                                <td
                                    style={{
                                        textAlign: "center",
                                        color: item.trangThai === 0 ? "#6c757d" : "#155724", // Xám đậm hoặc Xanh đậm
                                    }}
                                >
                                    {item.trangThai === 0 ? "Không sử dụng" : "Đang sử dụng"}
                                </td>
                                <td class="sticky-col">
                                    <a onClick={() => setItem(item)} data-bs-toggle="modal" data-bs-target="#addcate"
                                       class="edit-btn"><i className='fa fa-edit'></i></a>
                                    <button onClick={() => deleteData(item.id)} class="delete-btn"><i
                                        className='fa fa-trash'></i></button>
                                </td>
                            </tr>
                        }))}
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal fade" id="addcate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header"><h5 class="modal-title" id="exampleModalLabel">Thêm hoặc cập nhật chất
                            liệu</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body">
                            <form className="col-sm-5 marginauto" onSubmit={saveData} method='post'>
                                <label>Tên</label>
                                <input
                                    defaultValue={item?.tenDeGiay || ""}
                                    name="catename"
                                    id='catename'
                                    type="text"
                                    className="form-control"
                                />
                                <br/>
                                <label>Trạng thái</label>
                                <div className="form-check">
                                    <input
                                        className="form-check-input"
                                        type="radio"
                                        name="status"
                                        id="status1"
                                        value="1"
                                        defaultChecked={item?.trangThai === 1 || !item}
                                    />
                                    <label className="form-check-label" htmlFor="status1">
                                        Đang sử dụng
                                    </label>
                                </div>
                                <div className="form-check">
                                    <input
                                        className="form-check-input"
                                        type="radio"
                                        name="status"
                                        id="status0"
                                        value="0"
                                        defaultChecked={item?.trangThai === 0}
                                    />
                                    <label className="form-check-label" htmlFor="status0">
                                        Không sử dụng
                                    </label>
                                </div>
                                <br/>
                                <button className="btn btn-success form-control action-btn">Xác nhận</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default AdminChatLieu;
